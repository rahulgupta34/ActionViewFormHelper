Rails.application.routes.draw do
  resources :posts
  resources :colleges
  
  root "posts#index"
  resources :posts do 
    member do 
      get "versions", to: "posts#versions"
      get "version/:version_id", to: "posts#version", as: "version"
      post "revert/:version_id", to: "posts#revert", as: "revert"
      post "restore", to: "posts#restore", as: "restore"
    end
  end
  get "deleted", to: "posts#deleted"
end
