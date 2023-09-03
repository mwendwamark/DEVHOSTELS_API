class Hostel < ApplicationRecord
  has_many :users
  has_many :reservations
  has_many :reviews, through: :reservations

  validates :price_per_day, presence: true, numericality: { greater_than: 0 }

  def reserved_dates
    reservations.pluck(:start_date, :end_date).map do |start_date, end_date|
      (start_date..end_date).to_a
    end.flatten
  end
end
