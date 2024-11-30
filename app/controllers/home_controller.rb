# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :authenticate_user!, only: %i[dashboard dashboard_admin]
  before_action :authorize!, only: %i[dashboard_admin]

  def rooting
    return redirect_to dashboard_path if user_signed_in? && current_user.client?

    return redirect_to dashboard_admin_path if admin_or_stylist_signed_in?

    redirect_to welcome_path
  end

  def welcome; end

  def dashboard
    @cities = City.all
    @locals = load_locals
    @appointments =
      current_user.appointments.order(created_at: :desc).limit(5)
  end

  private

  def admin_or_stylist_signed_in?
    user_signed_in? && (current_user.admin? || current_user.stylist?)
  end

  def load_locals
    return Local.all unless params[:city_id].present?

    Local.where(city_id: params[:city_id])
  end
end
