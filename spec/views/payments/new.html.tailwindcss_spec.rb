# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'payments/new', type: :view do
  before(:each) do
    assign(:payment, Payment.new(
      billing_status: 1,
      user: nil,
      appointment: nil
    ))
  end

  it 'renders new payment form' do
    render

    assert_select 'form[action=?][method=?]', payments_path, 'post' do

      assert_select 'input[name=?]', 'payment[billing_status]'

      assert_select 'input[name=?]', 'payment[user_id]'

      assert_select 'input[name=?]', 'payment[appointment_id]'
    end
  end
end
