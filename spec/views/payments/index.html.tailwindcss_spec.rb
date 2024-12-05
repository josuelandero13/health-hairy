# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'payments/index', type: :view do
  before(:each) do
    assign(:payments, [
      Payment.create!(
        billing_status: 2,
        user: nil,
        appointment: nil
      ),
      Payment.create!(
        billing_status: 2,
        user: nil,
        appointment: nil
      )
    ])
  end

  it 'renders a list of payments' do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
