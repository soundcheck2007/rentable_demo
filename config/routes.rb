Rails.application.routes.draw do
  get 'properties/index'
  get 'rentable', to: 'rentable#index'
  resources :property, only: [:create]
end
