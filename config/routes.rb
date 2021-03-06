Rails.application.routes.draw do

  get '/reservations/:id/braintree/new' => "braintree#new", as: "braintree_new"
  post '/reservations/:id/braintree/checkout' => "braintree#checkout", as: "braintree_checkout"

  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, controller: "users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#show"
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"

  resources :listings do 
    resources :reservations, only: [:create]
  end

  get "/searchresult" => "listings#searchresult"

  resources :users, except: [:create]
  # get "/user/:id/edit" => "users#edit"
  # get "/user/:id" => "users#show"
end
