Rails.application.routes.draw do
  root "urls#index"
  resources :urls, only: [:index, :create, :show]
  get "/:slug", to: "redirect#show", as: "redirect"
end
