class Guess < ApplicationRecord
  belongs_to :user, dependent: :destroy

  validates_presence_of :lat, :lng
end
