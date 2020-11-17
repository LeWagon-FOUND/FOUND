Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'


  resources :chatrooms, only: [:index, :show, :new, :create] do
    resources :messages, only: :create
  end

  resource :user do
      resources :items
  end
  get 'dashboard', to: 'pages#dashboard', as: :dashboard
  get 'public_profile/:id', to: "pages#public", as: :public_profil
  get 'generate', to: "pages#generate", as: :generate
end
