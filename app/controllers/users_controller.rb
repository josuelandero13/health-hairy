# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])

    redirect_to root_path if @user.nil?

    @appointments = current_user.appointments.order(created_at: :desc)
    @pagy, @appointments = pagy(@appointments, items: 12)
  end
end
