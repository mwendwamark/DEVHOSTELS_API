class User < ApplicationRecord
  has_many :reservations
  has_many :reviews
  has_many :messages
  require "securerandom"

  has_secure_password
  serialize :wishlist, Array

  # Validations
  validates :email, :first_name, :last_name, :password, :password_confirmation, presence: true
  validates :email, uniqueness: true
  validates :role, inclusion: { in: ["Hostel Owner", "Student"] }
  validates :first_name, :last_name, length: { maximum: 64, minimum: 2 }
  validates :password, length: { minimum: 6, maximum: 64 }
  validates :phone_number, uniqueness: true
  validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP
end
