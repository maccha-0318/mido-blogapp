Rails.application.routes.draw do
  devise_for :users
  root to: "articles#index"

  resources :articles do
    resources :comments, only: [:new, :create]
  end

  resource :profile, only: [:show, :edit, :update]

  get "/.well-known/*path", to: proc { [ 404, {}, [ "Not Found" ] ] }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # 一旦非表示 get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  # 一旦非表 get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  # 一旦非表 get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
end
