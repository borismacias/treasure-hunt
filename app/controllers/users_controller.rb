class UsersController < ApplicationController
  def create
    user = User.create(user_params)
    if user.errors.present?
      render json: { errors: user.errors.full_messages.to_sentence }, status: 422
    else
      render json: { id: user.id }, status: 201
    end
  end

  def show
    @user = User.find(params[:id])
    render json: @user.attributes.to_json
  end

  private

  def user_params
    params.permit(:name, :email)
  end
end
