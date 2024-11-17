# frozen_string_literal: true

class CreateCities < ActiveRecord::Migration[8.0]
  def change
    create_table :cities, id: :uuid do |t|
      t.string :name

      t.timestamps
    end
  end
end
