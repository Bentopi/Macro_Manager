Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#home'


  get 'about' => 'welcome#about', as: :about
  get 'coaching' => 'welcome#coaching', as: :coaching


  get 'guestmacros' => 'macros#guest_macros', as: :guest_macros
  post 'guestmacros' => 'macros#guest_macros'

  get 'macros' => 'macros#show', as: :macros
  get 'macros/edit' => 'macros#edit', as: :edit_macros
  patch 'macros/edit' => 'macros#update'
  patch 'macros/up' => 'macros#notch_up', as: :notch_up
  patch 'macros/down' => 'macros#notch_down', as: :notch_down


  post 'mealplans' => 'mealplans#auto_mealplans', as: :auto_mealplans
  patch 'mealplans/generate/:id' => 'mealplans#generate', as: :generate_mealplan
  get 'mealplans' => 'mealplans#list', as: :mealplans
  post 'mealplans' => 'mealplans#new', as: :new_mealplan
  get 'mealplans/:id' => 'mealplans#show', as: :mealplan
  get 'mealplans/edit/:id' => 'mealplans#edit', as: :edit_mealplan
  delete 'mealplans/:id' => 'mealplans#delete_mealplan', as: :delete_mealplan
  patch 'mealplans/edit/:id' => 'mealplans#add_meal', as: :add_meal
  delete 'mealplans/:id/meals/:meal_id' => 'mealplans#delete_meal', as: :delete_meal


  get 'meal/:id' => 'food#show_meal', as: :meal
  get 'ingredient/:id' => 'food#show_ingredient', as: :ingredient
  get 'mealcenter' => 'food#mealcenter', as: :mealcenter
  get 'foodfinder' => 'food#finder', as: :food_finder
  post 'foodfinder' => 'food#search', as: :search_food
  post 'favorites' => 'food#add_favorite', as: :add_favorite
  get 'favorites' => 'food#favorites', as: :favorites
  delete 'favorites/:id' => 'food#delete_favorite', as: :delete_favorite
  get 'recipecollections' => 'food#recipe_collections', as: :recipe_collections


  get 'registration' => 'users#new', as: :new_user
  post 'registration' => 'users#create', as: :create_user
  get 'profile' => 'users#profile', as: :user_profile
  get 'profile/edit' => 'users#edit_profile', as: :edit_profile
  patch 'profile/edit' => 'users#update_profile'


  get 'sign_in' => 'sessions#new', as: :sign_in
  post 'sign_in' => 'sessions#create'
  delete 'sign_in' => 'sessions#destroy'





end
