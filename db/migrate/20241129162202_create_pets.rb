# frozen_string_literal: true

class CreatePets < ActiveRecord::Migration[8.0]
  def change
    create_table :pets, id: :uuid do |t|
      t.string :name, null: false
      t.string :bred, null: false
      t.integer :kind, null: false
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
