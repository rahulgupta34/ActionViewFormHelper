require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  root 'home#index'
  resources :colleges
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/testapi", to: "testapi#index"
  get "/testapi/:id", to: "testapi#show"
  get "/posts/:id", to: "testapi#comments"
end
