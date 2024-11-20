module Authorization
  extend ActiveSupport::Concern

  included do
    class NotAuthorizedError < StandardError; end

    rescue_from NotAuthorizedError do
      alert_message = t('alerts.authentication.user_not_authorized')
      redirect_to root_path, alert: alert_message
    end

    private

    def authorize!(record = nil)
      policy_class = "#{controller_name.singularize.classify}Policy"
      is_allowed = policy_class.constantize.new(record, current_user).send(action_name)

      raise NotAuthorizedError unless is_allowed
    end
  end
end
