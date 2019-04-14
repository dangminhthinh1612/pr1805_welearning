Rails.application.routes.draw do

  root "static_pages#home"
  get "/help" , to: "static_pages#help"
  get "/about" , to: "static_pages#about"
  get "/contact" , to: "static_pages#contact"
  get "/news" , to: "static_pages#news"

  get  "/signup",  to: "users#new"
  post "/signup",  to: "users#create"

  get "/login" , to: "sessions#new"
  post "/login" , to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :account_activations, only: :edit
  resources :password_resets, except: :show
  resources :searches, only: :index
  resources :courses, only: [:index, :show] do
    resources :reviews, only: [:index, :create, :new]
  end
  
  scope shallow_prefix: "ucname" do
    resources :users, except: :index do
      resources :user_courses, shallow: true
      resources :carts, shallow: true
    end
  end

  resources :messages, only: [:create, :index], path: "chat"

  namespace :admin do
    root "dashboards#index"

    scope shallow_prefix: "sname" do
      resources :courses do
        resources :lessons, shallow: true
      end
    end
    resources :searches, only: :index
    resources :users
  end
end
