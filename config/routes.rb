Rails.application.routes.draw do

  root "static_pages#home"

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

  resources :lessons
  resources :chatrooms do
    resources :chatroom_users
    resources :messages
  end

  mount ActionCable.server, at: "/cable"

  namespace :admin do
    root "dashboards#index"
    get "/chart", to: "dashboards#chart"

    scope shallow_prefix: "sname" do
      resources :courses do
        resources :lessons, shallow: true
      end
    end

    resources :lessons, shallow: true do
      resources :excercises
    end

    resources :searches, only: :index
    resources :users

    scope shallow_prefix: "crname" do
      resources :chatrooms do
        resources :messages, shallow: true
      end
    end
  end
end
