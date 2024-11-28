# frozen_string_literal: true

class Authentication::UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    binding.break
    successful_message =
      t('authentication.users.actions.create.user_created')

    return redirect_to root_path, notice: successful_message if @user.save

    render :new, status: :unprocessable_entity
  end

  def edit; end

  def update; end

  private

  def user_params
    params.require(:user).permit(
      :first_name, :last_name, :email,
      :username, :phone, :password,
      :password_confirmation, :role, :avatar
    )
  end
end
