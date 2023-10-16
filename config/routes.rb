Rails.application.routes.draw do 
  get 'shopping_list/index'
  get 'public_recipes/index'
  get 'recipes/index'
  get 'recipes/show'
  get 'recipes/new'
  get 'recipes/create'
  get 'recipes/destroy'
  get 'recipe_foods/index'
  get 'recipe_foods/show'
  get 'recipe_foods/new'
  get 'recipe_foods/create'
  get 'recipe_foods/destroy'
  get 'foods/index'
  get 'foods/show'
  get 'foods/new'
  get 'foods/create'
  get 'foods/destroy'
  devise_for :users
  root "users#index"
  resources :users, only: [:index, :show] do
    resources :recipes, only: [:index, :show, :new, :create, :destroy] 
    resources :foods, only: [:index, :show, :new, :create, :destroy]
    resources :recipe_foods, except: %i[edit update] 
    resources :public_recipes, only: [:index]
    resources :shopping_list, only: [:index]
  end
end

