Rails.application.routes.draw do
  resources :users
  resources :colleges
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
  get "/profile", to: "home#profile"
  post "/profile", to: "home#profile"
end
