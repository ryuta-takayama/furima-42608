Rails.application.routes.draw do
  devise_for :users
  resources  :items
  resources :orders, only: [:index, :create]
  root to: "items#index"
end
