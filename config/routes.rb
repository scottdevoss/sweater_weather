Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do
    namespace :v0 do
      resources :forecast, only: [:index]
    end
  end

  # get "/api/v0/forecast", to: "forecast#index"
end
