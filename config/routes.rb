Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#home'
  post '/' => 'welcome#home'
  get 'mealplan' => 'mealplan#new', as: :meal_plan
  get 'foodsearch' => 'food#list', as: :food_list
  post 'foodsearch' => 'food#search', as: :search_food

end
