Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'categories#index'
  resources :recipe, only: %i[]
  resources :categories, only: %i[index show] do
    resources :recipes, only: %i[index show create new update]
  end
end
