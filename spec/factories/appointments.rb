FactoryBot.define do
  factory :appointment do
    status { 1 }
    user { nil }
    appointment_type { nil }
    start_at { '2024-11-29 15:10:21' }
    end_at { '2024-11-29 15:10:21' }
  end
end
