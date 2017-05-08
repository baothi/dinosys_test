Rails.application.routes.draw do
  get 'home/show'
  get 'home/total'

  root "home#index"
  resources :expenses
  resources :categories
  resources :employees
end
