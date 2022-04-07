Rails.application.routes.draw do
  resources :posts
  resources :colleges
  
  root "posts#index"
  get "/history", to: "posts#history"
  get "/posts/:id/undo", to: "posts#undo"
  post "/posts/:id/undo", to: "posts#undo", as: :undo
end
