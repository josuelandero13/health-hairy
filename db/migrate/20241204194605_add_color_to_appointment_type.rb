# frozen_string_literal: true

class AddColorToAppointmentType < ActiveRecord::Migration[8.0]
  def change
    add_column :appointment_types, :color, :string, default: '#000000'
  end
end
