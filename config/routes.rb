Rails.application.routes.draw do 
  devise_for :users
  root "foods#index"
 resources :foods, except: :update
  resources :recipes, except: :update do
    resources :recipe_foods, only: [:index, :new, :create, :destroy]
  end
end

