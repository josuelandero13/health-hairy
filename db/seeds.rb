# frozen_string_literal: true

User.destroy_all
AppointmentType.destroy_all
City.destroy_all
Local.destroy_all

user1 = User.create!(
  first_name: 'tester1',
  last_name: 'tester petspa',
  username: 'tester1',
  email: 'tester1@petspa.com',
  phone: '+56 999 999 999',
  password: '12345678',
  role: 2
)

# user2 = User.create!(
#   first_name: 'tester2',
#   last_name: 'tester petspa',
#   username: 'tester2',
#   email: 'tester2@petspa.com',
#   phone: '+56 999 999 998',
#   password: '12345',
#   role: 0
# )

# pet1 = Pet.create!(
#   name: 'Firulais', breed: 'Poodle',
#   important_data: 'Muerde a veces', user: user2,
#   kind: 0
# )

city1 = City.create!(name: 'Leon')
city2 = City.create!(name: 'San Marcos')
city3 = City.create!(name: 'New York')
city4 = City.create!(name: 'Buenos Aires')
city5 = City.create!(name: 'Santiago')

local1 = Local.create!(
  address: 'Av. Los Pinos 123',
  city: city1
)
local2 = Local.create!(
  address: 'Av. Los Arandanos 123',
  city: city2
)
local3 = Local.create!(
  address: 'Av. Pizarro 123',
  city: city3
)

appointment_type1 = AppointmentType.create!(
  name: 'Baño', payment_required: true,
  user: user1, price: 100,  color: '#38bdf8'
)

appointment_type2 = AppointmentType.create!(
  name: 'Baño y corte', payment_required: true,
  user: user1, price: 180, color: '#fbbf24'
)

appointment_type3 = AppointmentType.create!(
  name: 'Session spa premium', payment_required: true,
  user: user1, price: 250,  color: '#34d399'
)

puts 'Seed finished!'

# 15.times do |t|
#   appointment = Appointment.create!(
#     start_at: DateTime.now + t.day,
#     end_at: DateTime.now + t.day + 1.hour,
#     pet: pet1, client: user2,
#     appointment_type: appointment_type1,
#     status: 0, local: local1
#   )
#   payment = Payment.create!(
#     appointment: appointment,
#     user: user2
#   )
#   payment.receipt.attach(io: URI.open(Faker::LoremFlickr.image), filename: 'receipt_image.jpg')
# end
#
# 20.times do |t|
#   appointment = Appointment.create!(
#     start_at: DateTime.now + t.day,
#     end_at: DateTime.now + t.day + 1.hour,
#     pet: pet1, client: user2,
#     appointment_type: appointment_type1,
#     status: 0, local: local2
#   )
#   payment = Payment.create!(
#     appointment: appointment,
#     user: user2
#   )
#   payment.receipt.attach(io: URI.open(Faker::LoremFlickr.image), filename: 'receipt_image.jpg')
# end
#
# 25.times do |t|
#   appointment = Appointment.create!(
#     start_at: DateTime.now + t.day,
#     end_at: DateTime.now + t.day + 1.hour,
#     pet: pet1, client: user2,
#     appointment_type: appointment_type1,
#     status: 0, local: local3
#   )
#   payment = Payment.create!(
#     appointment: appointment,
#     user: user2
#   )
#   payment.receipt.attach(io: URI.open(Faker::LoremFlickr.image), filename: 'receipt_image.jpg')
# end
