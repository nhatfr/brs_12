Rails.application.routes.draw do
  devise_for :users
  
  root to: "static_pages#home"

  resources :users, except: [:index, :destroy]
  resources :categories, only: [:index, :show]
  resources :books, except: [:new, :create, :destroy]

  devise_scope :user do
    get "/login" => "devise/sessions#new"
    get "/logout" => "devise/sessions#destroy"
    get "/signup" => "devise/registrations#new"
    get "/edit" => "devise/registrations#edit"
  end

  namespace :admin do
    resources :users
    resources :categories
    resources :books
    root to: "users#index"
  end

end
