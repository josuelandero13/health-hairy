# frozen_string_literal: true

FactoryBot.define do
  factory :pet do
    name { 'MyString' }
    bred { 'MyString' }
    kind { 1 }
    user { nil }
  end
end
