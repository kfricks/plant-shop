Rails.application.routes.draw do
  devise_for :users
  get 'plant_types/index'
  get 'plant_types/show'
  get 'plant_types/search'

  get 'styleguide',   to: 'style_guide#styleguide'

  resources :plants
  resources :trades

  # plants by another user
  # /users/:user_id/plants      (index)
  # /users/:user_id/plants/:id  (show)
  resources :users do
    resources :plants, only: [:show, :index]
  end
  # make myplants


  root to: "plants#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
