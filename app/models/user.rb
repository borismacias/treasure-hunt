class User < ApplicationRecord
  before_create :set_access_token

  validates_presence_of :name, :email

  def set_as_winner!
    return if winner

    update(winner: true)
    notify_user
  end

  private

  def notify_user
  end

  def set_access_token
    access_token = SecureRandom.urlsafe_base64(nil, false)
    access_token = SecureRandom.urlsafe_base64(nil, false) until User.find_by(access_token:).blank?

    self.access_token = access_token
  end
end
