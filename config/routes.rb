Rails.application.routes.draw do
  get 'foods/index'
  devise_for :users

  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  #root "users#index"

  # Defines the root path route ("/")

   root "users#index"

end

