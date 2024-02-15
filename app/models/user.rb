class User < ApplicationRecord
  before_create :set_access_token
  has_many :guesses
  validates_presence_of :name, :email

  scope :winners, -> { includes(:guesses).where(winner: true).order(Arel.sql('guesses.distance_to_target ASC')) }

  def winner!(guess)
    return if winner

    update(winner: true)
    notify_win(guess)
  end

  def serialize
    attributes.slice('id', 'name', 'email')
  end

  private

  def notify_win(guess)
    UserMailer.notify_winner(self, guess).deliver_later
  end

  def set_access_token
    access_token = SecureRandom.urlsafe_base64(nil, false)
    access_token = SecureRandom.urlsafe_base64(nil, false) until User.find_by(access_token:).blank?

    self.access_token = access_token
  end
end
