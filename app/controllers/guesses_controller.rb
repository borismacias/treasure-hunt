class GuessesController < ApplicationController
  def create
    guess = Guess.create(guess_params)

    if guess.errors.present?
      render json: { errors: guess.errors.full_messages.to_sentence }, status: 422
    else
      check_winner(guess)
      render json: { id: guess.id }, status: 201
    end
  end

  private

  def check_winner(guess)
    guess.check_winner
    guess.reload
    user.winner! if guess.distance < 1000
  end

  def guess_params
    params.permit(:lat, :lng).merge(user_id: @user.id)
  end
end
