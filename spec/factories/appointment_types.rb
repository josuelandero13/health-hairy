# frozen_string_literal: true

FactoryBot.define do
  factory :appointment_type do
    payment_required { false }
    name { 'MyString' }
    user { nil }
    price { 1 }
    description { nil }
  end
end
