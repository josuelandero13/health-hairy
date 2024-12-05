# frozen_string_literal: true

FactoryBot.define do
  factory :payment do
    billing_status { 1 }
    user { nil }
    appointment { nil }
  end
end
