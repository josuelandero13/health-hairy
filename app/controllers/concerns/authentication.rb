module Authentication
  extend ActiveSupport::Concern

  included do
    private

    def authenticate_user!
      alert_message = t('alerts.authentication.user_not_logged_in')
      redirect_to root_path, alert: alert_message unless user_signed_in?
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
end
