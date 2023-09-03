class Review < ApplicationRecord
  belongs_to :reservation

  validates :ratings, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
  validates :comments, presence: true
end
