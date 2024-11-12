# frozen_string_literal: true

class Authentication::PasswordsController < ApplicationController
  def edit; end

  def update
    notice_password_update =
      t('authentication.passwords.actions.update.password_updated')

    return render :edit unless current_user.update(password_params)

    redirect_to root_path, notice: notice_password_update
  end

  private

  def password_params
    params.require(:user).permit(
      :password,
      :password_confirmation,
      :password_challenge
    ).with_defaults(password_challenge: '')
  end
end
