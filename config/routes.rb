Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'home#index', as: 'home'
  get 'categories', to: 'categories#index', as: 'categories'
  get 'payments/:category_id', to: 'payments#show', as: 'show_payments'
  get 'categories/new', to: 'categories#new', as: 'categories_new'

  post 'categories/create', to: 'categories#create', as: 'create_new_category'
  post 'categories/delete', to: 'categories#delete', as: 'delete_category'
end
