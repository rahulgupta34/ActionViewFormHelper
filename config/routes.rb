Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "employees#index"
  get "search", to: "employees#search_new"
  

  resources :employees
end
