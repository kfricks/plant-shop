Rails.application.routes.draw do
  get 'plant_types/index'
  get 'plant_types/show'
  get 'plant_types/search'

  resources :plants

  devise_for :users
  root to: "plants#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
