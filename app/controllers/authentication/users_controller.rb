# frozen_string_literal: true

class Authentication::UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    return redirect_to root_path, notice: t('.account_created') if @user.save

    render :new, status: :unprocessable_entity
  end

  private

  def user_params
    params.require(:user).permit(
      :first_name, :last_name, :email,
      :username, :phone, :password,
      :password_confirmation, :role
    )
  end
end
