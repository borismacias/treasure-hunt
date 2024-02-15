class Guess < ApplicationRecord
  belongs_to :user, dependent: :destroy

  validates_presence_of :lat, :lng

  def check_winner
    distance = CalculateDistanceToTarget.for(lat:, lng:)
    distance < 1000
  end
end
