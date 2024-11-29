# frozen_string_literal: true

class AddClientToAppointment < ActiveRecord::Migration[8.0]
  def change
    add_reference :appointments, :client, null: false,
                                          foreign_key: {
                                            to_table: :users
                                          },
                                          type: :uuid
  end
end
