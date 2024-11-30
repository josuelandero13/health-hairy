class CityPolicy < BasePolicy
  def dashboard_admin?
    @current_user&.admin?
  end
end
