Rails.application.routes.draw do
  post "/rate" => "rater#create", as: "rate"
  devise_for :users

  root to: "books#index"

  resources :relationships, only: [:create, :destroy]
  resources :perusals, only: [:create, :destroy]
  resources :likes, only: [:create, :destroy]
  resources :categories, only: [:index, :show]
  resources :requests, except: :show

  resources :users, except: :destroy do
    resource :favorites, only: [:edit, :show]
    resource :readings, except: [:new, :edit]
  end

  resources :books, except: [:new, :create, :destroy] do
    resources :reviews, only: [:create, :destroy]
  end

  resources :reviews, only: [:create, :destroy] do
    resources :comments, only: [:create, :update, :destroy]
  end

  devise_scope :user do
    get "/login" => "devise/sessions#new"
    get "/logout" => "devise/sessions#destroy"
    get "/signup" => "devise/registrations#new"
    get "/edit" => "devise/registrations#edit"
  end

  namespace :admin do
    resources :users, only: [:index, :show, :destroy]
    resources :categories
    resources :requests, only: [:index, :update, :destroy]
    resources :books do
      resources :reviews
    end

    resources :reviews do
      resources :comments
    end
    
    root to: "books#index"
  end
end
