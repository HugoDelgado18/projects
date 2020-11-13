Rails.application.routes.draw do
  resources :notes
  resources :todo_lists 
  resources :todo_items
  resources :affirmations, only: [:index]
  devise_for :users
  resources :appointments
  root to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
