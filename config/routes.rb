Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :chatrooms, only: [:index, :show] do
    resources :messages, only: :create
  end

  resources :profiles

  get 'public_profile/:id', to: "profiles#public"

end
