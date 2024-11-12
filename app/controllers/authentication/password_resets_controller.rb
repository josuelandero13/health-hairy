# frozen_string_literal: true

class Authentication::PasswordResetsController < ApplicationController
  before_action :set_user_by_token, only: %i[edit update]

  def new; end

  def create
    user = User.find_by(email: params[:email])
    password_prompt_to_reset =
      t('authentication.password_resets.actions.create.password_reset_instructions')
    inocorect_email =
      t('authentication.password_resets.actions.create.incorrect_email')

    return redirect_to root_path, alert: inocorect_email unless user&.present?

    send_password_reset_email(user)
    redirect_to root_path, notice: password_prompt_to_reset
  end

  def edit; end

  def update
    if @user.update(password_params)
      notice_password_update =
        t('authentication.password_resets.actions.update.password_reset_success')
      redirect_to new_session_path, notice: notice_password_update
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end

  def set_user_by_token
    @user = User.find_by_token_for(:password_reset, params[:token])
    alert_message = t('authentication.password_resets.invalid_token_alert')

    return if @user.present?

    redirect_to new_password_reset_path, alert: alert_message
  end

  def send_password_reset_email(user)
    token = user.generate_token_for(:password_reset)
    PasswordMailer.with(user: user, token: token).password_reset.deliver_later
  end
end
