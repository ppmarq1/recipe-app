Rails.application.routes.draw do
  #get 'general_shopping_list/index'

  devise_for :users


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  #root "foods#index"

  # Defines the root path route ("/")

  root 'foods#index'

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  post  'recipes/:recipe_id/recipe_foods', to: 'recipe_foods#create'
  patch '/recipes/:recipe_id/recipe_foods', to: 'recipe_foods#update', as: 'edit_recipe_recipe_food'

  resources :users
  resources :foods, only: [:index, :show, :new, :create, :destroy]
  resources :recipes, only: [:index, :show, :new, :create, :destroy] do
    resources :recipe_foods, only: [:index, :show, :new, :create, :destroy]
  end
  resources :public_recipes, only: [:index]
  resources :general_shopping_list, only: [:index]
end
