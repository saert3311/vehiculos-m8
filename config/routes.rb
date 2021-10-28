Rails.application.routes.draw do
  root 'vehiculos#index'
  resources :vehiculos
end
