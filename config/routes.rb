Rails.application.routes.draw do
  get 'rentable', to: 'rentable#index'
  resources :property, only: [:create]
end
