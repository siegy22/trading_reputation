Rails.application.routes.draw do
  namespace :admin do
    get 'games/index'
  end

  namespace :admin do
    get 'games/new'
  end

  namespace :admin do
    get 'games/create'
  end

  namespace :admin do
    get 'games/edit'
  end

  namespace :admin do
    get 'games/update'
  end

  namespace :admin do
    get 'games/destroy'
  end

  root to: "pages#show", page: "home"

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  # devise only creates logout route for database auth
  namespace :users do
    delete :sign_out, to: "sessions#destroy", as: "sign_out"
  end

  namespace :admin do
    resources :games, execpt: :show
  end

  resource :me, only: [:show, :edit, :update], controller: "me" do
    resources :connections, only: :index
  end
end
