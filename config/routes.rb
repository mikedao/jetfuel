Rails.application.routes.draw do
  root "urls#index"
  resources :urls, only: [:index, :create, :show]
  get "/:slug", to: "redirect#show", as: "redirect"

  namespace :api do
    namespace :v1 do
      get "/url", to: "urls#show", defaults: { format: "json" }
    end
  end
end
