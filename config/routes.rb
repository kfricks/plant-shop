Rails.application.routes.draw do
  get 'trades/new'
  get 'trades/create'
  get 'trades/update'
  get 'trades/edit'
  get 'trades/destroy'
  get 'trades/index'
  get 'trades/show'
  get 'plant_types/index'
  get 'plant_types/show'
  get 'plant_types/search'

  resources :plants
  resources :users do
    resources :plants, only: [:show, :index]
  end
  # make myplants
  # plants by another user

  devise_for :users
  root to: "plants#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
