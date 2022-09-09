Rails.application.routes.draw do

  devise_for :users


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  #root "users#index"

  # Defines the root path route ("/")

  root 'public_recipes#index'

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :users
  resources :foods, only: [:index, :show, :new, :create, :destroy]
  resources :recipes, only: [:index, :show, :new, :create, :destroy] do
    resources :recipe_foods, only: [:index, :show, :new, :create, :destroy]
  end
  resources :public_recipes, only: [:index]
  resources :shopping_list, only: [:index]
end
