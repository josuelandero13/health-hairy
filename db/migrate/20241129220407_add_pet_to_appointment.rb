# frozen_string_literal: true

class AddPetToAppointment < ActiveRecord::Migration[8.0]
  def change
    add_reference :appointments, :pet, foreign_key: true, type: :uuid
  end
end
