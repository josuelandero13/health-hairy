# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  has_one_attached :avatar
  has_many :pet, dependent: :destroy
  has_many :appointments, foreign_key: :client_id, dependent: :destroy

  validates :first_name, :last_name, :email, :username, :phone, :password, presence: true
  normalizes :username, :first_name, :last_name, with: ->(value) { value&.downcase }
  validates :password, length: { minimum: 8 }
  validates :email, uniqueness: true,
                    format: {
                      with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i,
                      message: :invalid
                    }
  normalizes :email, with: ->(email) { email&.downcase }
  validates :username, uniqueness: true,
                       length: { in: 3..20 },
                       format: {
                         with: /\A[a-zA-Z0-9]+\z/,
                         message: :invalid
                       }
  validates :phone, presence: true

  generates_token_for :password_reset, expires_in: 15.minutes do
    password_salt&.last(10)
  end

  generates_token_for :email_confirmation, expires_in: 24.hours do
    email
  end

  enum :role, %i[client stylist admin]

  ROLES = %w[client stylist admin].freeze

  ROLES.each do |role|
    define_method "#{role}?" do
      role == self.role
    end
  end
end
