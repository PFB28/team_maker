Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :games, only: [:index, :show, :new, :create] do
    resources :bookings, only: [:create]
  end
  resources :bookings, only: [:index]
  get '/my_games', to: 'games#owner_index'
  get '/my_bookings', to: 'bookings#owner_index'
  resources :bookings, only: [] do
      post :accept, on: :member
      post :refuse, on: :member
      post :cancel, on: :member
  end
end
