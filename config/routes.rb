Rails.application.routes.draw do
  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :stock, only: %i[new create index show]

  resources :clients, only: %i[new index create]



  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'

  # get "index", to: "home#index"
  root 'home#index'
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
