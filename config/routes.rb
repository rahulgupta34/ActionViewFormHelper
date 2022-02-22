Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "home#index"
  
  get "/users", to: "users#index", as: "user"
 
  resources :users, only: [:index,:show] do 
    resources :products, only: [:index,:show,:destroy]
  end

   namespace :admin do 
     resources :users
   end
  
  scope module: "admin" do
    resources :users
  end

  resources :users, module: "admin"

  scope "/admin" do 
    resources :users
  end

end
