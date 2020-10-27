Rails.application.routes.draw do
  
  resources :items, only: :index
  root "items#index"

end
