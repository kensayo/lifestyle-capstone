Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'categories#index'
  resources :recipe, only: %i[create new show] do
    post '/vote', to: 'votes#vote'
  end
  resources :categories, only: %i[index show]
end
