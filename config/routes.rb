Rails.application.routes.draw do
  devise_for :users 
  
  root "foods#index"
  resources :foods, except: :update
   resources :recipes, except: :update do
   member do
   patch :toggle_public
   end
  resources :recipe_foods, only: [:new, :create, :edit, :update, :destroy]
   end
  get '/general_shopping_list', to: 'shopping_list#index', as: 'general_shopping_list'

  get 'public_recipes', to: 'public_recipes#index', as: 'public_recipes'

end