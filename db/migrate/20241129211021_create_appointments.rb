# frozen_string_literal: true

class CreateAppointments < ActiveRecord::Migration[8.0]
  def change
    create_table :appointments, id: :uuid do |t|
      t.integer :status
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.references :appointment_type, null: false, foreign_key: true, type: :uuid
      t.datetime :start_at
      t.datetime :end_at

      t.timestamps
    end
  end
end
