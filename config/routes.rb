Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  root "welcome#index"

  get "/log_in", to: "users#login_form"
  post "/log_in", to: "users#log_in"

  get "/log_out", to: "application#log_out"
  delete "/log_out", to: "application#log_out" # is this the right way to solve for this? Or should the log_out action be called from the button?

  post "/users/new", to: "users#create"

  resources :users, only: [:show, :new, :create]

  resources :shelters, only: [:show, :edit, :update] do
    resources :animals, only: [:create, :new, :show]
  end
end
