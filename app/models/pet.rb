# frozen_string_literal: true

class Pet < ApplicationRecord
  has_one_attached :photo
  belongs_to :user

  has_rich_text :important_notes
  validates :name, :bred, :kind, presence: true

  enum :kind, %i[dog cat bird other]
end
