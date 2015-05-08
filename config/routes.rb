Rails.application.routes.draw do
  resources :lessons, only: [:index]
end
