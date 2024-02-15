class Guess < ApplicationRecord
  belongs_to :user, dependent: :destroy

  validates_presence_of :lat, :lng

  DISTANCE_THRESHOLD = 1000

  def check_winner
    distance_to_target = CalculateDistanceToTarget.for(lat:, lng:)
    update(distance_to_target:)
    distance_to_target < DISTANCE_THRESHOLD
  end
end
