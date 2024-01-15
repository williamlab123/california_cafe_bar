Rails.application.routes.draw do
  get 'beehives/index'
  get 'dashboard/Index'
  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :stocks

  resources :clients

  resources :sales, only: %i[new create index show]

  resources :users, only: %i[new create]

  resources :sessions, only: %i[new create destroy]


  resources :dashboard, only: %i[index]

  resources :beehives_groups do
    post :collect, on: :member
  end  
  
  delete '/logout', to: 'sessions#destroy', as: :logout

  # get 'dashboard/sales_comparison', to: 'dashboard#sales_comparison'

  get '/dashboard/sales', to: 'dashboard#sales'
  get '/dashboard/compare-months', to: 'dashboard#compare_months'


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
