Rails.application.routes.draw do
  resources :users, only: %i[create show]
  resources :guesses, only: [:create]
end
