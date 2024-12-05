class PaymentPolicy < BasePolicy
  def method_missing(_method, *_args, &_block)
    @current_user&.admin?
  end

  def respond_to_missing?(_method, _include_private = false)
    false
  end
end
