Rails.application.routes.draw do
  resources :urls, only: [:index]
end
