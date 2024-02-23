Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  root "welcome#index"
  resources :users, only: [:new]

  get "/log_in", to: "users#login_form"
  post "/log_in", to: "users#log_in"

  get "/home", to: "home#index"

  get "/logout", to: "application#logout" # is this the right way to solve for this? Or should the logout action be called from the button?
end
