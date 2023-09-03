class Reservation < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :hostel, optional: true
  has_many :reviews

  # Define a method to fetch reviews for this reservation
  def fetch_reviews
    reviews.pluck(:ratings, :comments).map do |ratings, comments|
      { ratings: ratings, comments: comments }
    end
  end
end
