class GuessesController < ApplicationController
  def create
    guess = Guess.create(guess_params)

    if guess.errors.present?
      render json: { errors: guess.errors.full_messages.to_sentence }, status: 422
    else
      guess.check_winner
      render json: { id: guess.id }, status: 201
    end
  end

  private

  def guess_params
    params.permit(:lat, :lng).merge(user_id: @user.id)
  end
end
