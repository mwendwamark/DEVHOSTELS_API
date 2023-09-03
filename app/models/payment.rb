class Payment < ApplicationRecord
  belongs_to :reservation

  validates :mode_of_payment, presence: true
  validates :reservation_id, presence: true
end
