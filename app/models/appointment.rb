# frozen_string_literal: true

class Appointment < ApplicationRecord
  belongs_to :client, class_name: 'User'
  belongs_to :appointment_type
  belongs_to :pet
  belongs_to :local
  has_many :payments

  validates :start_at, :end_at, presence: true
  has_rich_text :notes
  enum :status, %I[scheduled processing finished]
end
