Rails.application.routes.draw do
  resources :statuses
  resources :users
  resources :furnitures
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
