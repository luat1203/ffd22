Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "products#index"

    devise_for :users, controllers: {
      registrations: "users/registrations",
    }
    get "static_pages/home"
    get "/signup", to: "users#new"
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    get "/carts", to: "carts#show"
    post "carts/create"
    delete "carts/destroy"
    post "carts/update"

    resources :products, :categories
    resources :users, only: %i(show index)
  end
end
