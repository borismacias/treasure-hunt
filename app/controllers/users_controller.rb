# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authorize_user, only: [:create]

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
    render json: @user.serialize
  end

  def winners
    render json: User.winners.map(&:serialize)
  end

  private

  def authorize_user
    head(403) unless @user.admin?
  end

  def user_params
    params.permit(:name, :email)
  end
end
