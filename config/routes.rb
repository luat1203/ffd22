Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "products#index"

    devise_for :users, controllers: {
      registrations: "users/registrations"
    }
    get "static_pages/home"
    get "/carts", to: "carts#show"
    post "carts/create"
    delete "carts/destroy"
    post "carts/update"
    post "comments/:id/edit", to: "comments#edit", as: "edit_comment"

    resources :products, :categories, :suggestions
    resources :users, only: %i(show index)
    resources :comments, only: %i(create update destroy)
    resources :orders, except: %i(new edit)
  end
end
