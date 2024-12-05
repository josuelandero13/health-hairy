# frozen_string_literal: true

class Payment < ApplicationRecord
  belongs_to :user
  belongs_to :appointment

  has_one_attached :receipt
  enum :billing_status, %i[pending paid unpproved]
end
