Rails.application.routes.draw do
  get 'sessions/create'

  root "welcome#index"

  get "/twitter/auth/", to: "sessions#create", as: :login
end
