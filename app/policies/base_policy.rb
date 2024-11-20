class BasePolicy
  attr_reader :record, :current_user

  def initialize(record, current_user)
    @record = record
    @current_user = current_user
  end

  def method_missing(_method, *_args, &_block)
    false
  end

  def respond_to_missing?(_method, _include_private = false)
    false
  end
end
