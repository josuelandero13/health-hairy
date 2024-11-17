# frozen_string_literal: true

class AppointmentType < ApplicationRecord
  belongs_to :user

  has_rich_text :description
end
