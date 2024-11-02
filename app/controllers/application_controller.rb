# frozen_string_literal: true
class ApplicationController < ActionController::Base
  around_action :switch_locale

  def switch_locale(&action)
    I18n.with_locale(locale_from_header, &action)
  end

  private

  def locale_from_header
    request.env['HTTP_ACCEPT_LANGUAGE']&.scan(/^[a-z]{2}/)&.first || I18n.default_locale
  end

  def authenticate_user!
    redirect_to root_path, alert: t('application.authenticate_user') unless user_signed_in?
  end

  def current_user
    Current.user ||= authenticate_user_from_session
  end

  helper_method :current_user

  def user_signed_in?
    current_user.present?
  end

  helper_method :user_signed_in?

  def authenticate_user_from_session
    User.find_by(id: session[:user_id])
  end

  def login(user)
    Current.user = user
    reset_session
    session[:user_id] = user.id
  end

  def logout(_user)
    Current.user = nil
    reset_session
  end
end
