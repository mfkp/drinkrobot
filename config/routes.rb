Drinkrobot::Application.routes.draw do
  resources :quantities
  resources :ingredients_recipes_quantities
  resources :ingredients_recipes
  resources :ingredients
  resources :recipes
  resources :favorites
  devise_for :users, :path_names => { :sign_up => "register" }
  match 'search/recipes/:name', :to => 'recipes#search'
  match 'recipes/ingredients/:name', :to => 'recipes#ingredients'
  match 'ingredients/search/:name', :to => 'ingredients#search'
  match 'search/ingredients/', :to => 'recipes#search_by_ingredients'
  match '/:controller(/:action(/:id))'
  
  root :to => "index#index"
end
