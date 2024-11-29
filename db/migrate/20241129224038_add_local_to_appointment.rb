# frozen_string_literal: true

class AddLocalToAppointment < ActiveRecord::Migration[8.0]
  def change
    add_reference :appointments, :local, foreign_key: true, type: :uuid
  end
end
