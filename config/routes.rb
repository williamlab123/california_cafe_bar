Rails.application.routes.draw do
  get 'barcodes/scan'
  get 'barcodes/search'
  get 'dashboard/Index'
  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :stocks

  resources :clients

  resources :sales do
    member do
      get :download_recipe
    end
  end

  resources :users, only: %i[new create]

  resources :sessions, only: %i[new index create destroy]

  resources :dashboard, only: %i[index]
  
  delete '/logout', to: 'sessions#destroy', as: :logout

  # get 'dashboard/sales_comparison', to: 'dashboard#sales_comparison'

  get '/dashboard/sales', to: 'dashboard#sales'
  get '/dashboard/compare-months', to: 'dashboard#compare_months'
  get '/dashboard/stock', to: 'dashboard#stock'


  get 'login', to: 'sessions#index'
  post 'login', to: 'sessions#create'

  get 'login/new', to: 'sessions#new'
  post 'sessions/new', to: 'sessions#create'
  post 'sessions/new', to: 'sessions#new'

   # Route for the scan page (input field to scan barcode)
   get 'barcodes/scan', to: 'barcodes#scan'

   resources :barcodes do
     post 'finish_sale', on: :collection
   end
   
   # Route to handle the barcode search
   post 'barcodes/search', to: 'barcodes#search'



  

  # get "index", to: "home#index"
  root 'home#index'
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
