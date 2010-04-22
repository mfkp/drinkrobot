Drinkrobot::Application.routes.draw do
  resources :quantities
  resources :ingredients_recipes_quantities
  resources :ingredients_recipes
  resources :ingredients
  resources :recipes
  resources :favorites
  devise_for :users, :path_names => { :sign_up => "register" }
  match 'recipes/search/:name' => 'recipes#search'
  match 'ingredients/search/:name' => 'ingredients#search'
  match '/:controller(/:action(/:id))'
  
  root :to => "index#index"
end
