# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'appointments/index', type: :view do
  before(:each) do
    assign(:appointments, [
      Appointment.create!(
        status: 2,
        user: nil,
        appointment_type: nil
      ),
      Appointment.create!(
        status: 2,
        user: nil,
        appointment_type: nil
      )
    ])
  end

  it 'renders a list of appointments' do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
