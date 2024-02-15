class ApplicationController < ActionController::API
  before_action :authenticate

  private

  def authenticate
    access_token = request.headers['access-token']
    @user = User.find_by(access_token:)
    head(401) if @user.blank?
  end
end
