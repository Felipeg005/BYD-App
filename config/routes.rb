Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'home#index', as: 'home'
  get 'categories', to: 'categories#index', as: 'categories'
end
