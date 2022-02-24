Rails.application.routes.draw do
  root "products#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :products

  resources :products do 
    resources :orders, only: [:create]
  end

  resources :orders

  namespace :business do
    resources :customers, only: [:new, :index, :edit, :create, :update]
  end

  get "/delete_customer", to: "business/customers#delete_customer"
  post "/delete_customer", to: "business/customers#delete_customer"
  get "/search", to: "business/customers#search"

  get "/name_preview", to: "business/customers#name_preview"
  post "/name_preview", to: "business/customers#name_preview"
end
