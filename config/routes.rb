Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check
  root "datasets#index"

  resources :datasets, only: [:index]
end
