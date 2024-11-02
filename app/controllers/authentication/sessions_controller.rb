# frozen_string_literal: true

class Authentication::SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(
      'email = :login OR username = :login', { login: params[:login] }
    )
    session_created_notice =
      t('authentication.sessions.actions.create.session_created')

    return render_login_error! unless authenticated_user?

    login @user
    redirect_to root_path, notice: session_created_notice
  end

  def destroy
    session_destroy_notice =
      t('authentication.sessions.actions.create.session_destroyed')

    logout current_user
    redirect_to root_path, notice: session_destroy_notice
  end

  private

  def render_login_error!
    invalid_credentials_notice =
      t('authentication.sessions.actions.create.invalid_credentials')

    render :new, status: :unprocessable_entity, alert: invalid_credentials_notice
  end

  def authenticated_user?
    !@user.nil? && @user.authenticate(params[:password])
  end
end
