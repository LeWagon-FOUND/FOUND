Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :chatrooms, only: [:new, :create, :show, :index, :destroy] do
    resources :messages, only: :create
  end

  resource :user do
      resources :items
  end

  get 'dashboard',                    to: 'pages#dashboard',  as: :dashboard
  get 'public_profile/:id',           to: "pages#public",     as: :public_profile
  get 'team',                         to: 'pages#team',       as: :the_team
  get 'public_profile/item/:id',      to: "pages#item",       as: :item_scanned
end
