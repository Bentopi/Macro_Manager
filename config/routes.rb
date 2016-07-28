Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#home'


  get 'guestmacros' => 'macros#guest_macros', as: :guest_macros
  post 'guestmacros' => 'macros#guest_macros'

  get 'mealplan' => 'mealplan#new', as: :meal_plan

  get 'foodsearch' => 'food#list', as: :food_list
  post 'foodsearch' => 'food#search', as: :search_food


  get 'registration' => 'users#new', as: :new_user
  post 'registration' => 'users#create', as: :create_user
  get 'profile' => 'users#profile', as: :user_profile

  get 'sign_in' => 'sessions#new', as: :sign_in
  post 'sign_in' => 'sessions#create'
  delete 'sign_in' => 'sessions#delete'

end
