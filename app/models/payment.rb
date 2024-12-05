class Payment < ApplicationRecord
  belongs_to :user
  belongs_to :appointment

  has_one_attached :receipt
  enum billing_status: { pending: 0, paid: 1, unpproved: 2 }
end
