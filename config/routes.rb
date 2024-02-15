Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  resources :users, only: %i[create show]
  resources :guesses, only: [:create]

  get '/winners' => 'users#winners'
end
