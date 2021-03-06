Rails.application.routes.draw do
  root "welcome#index"

  get "/auth/twitter", as: :login
  get "/auth/twitter/callback", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :users, only: [:update]
end
