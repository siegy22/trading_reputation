Rails.application.routes.draw do
  root to: "pages#show", page: "home"

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  # devise only creates logout route for database auth
  namespace :users do
    delete :sign_out, to: "sessions#destroy", as: "sign_out"
  end
end
