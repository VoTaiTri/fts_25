Rails.application.routes.draw do
  
  root "static_pages#home"
  get "help" => "static_pages#help"
  get "about" => "static_pages#about"
  get "contact" => "static_pages#contact"
  get "news" => "static_pages#news"

  devise_for :admins,
             class_name: "User",
             controllers: {sessions: "admins/sessions"},
             only: :sessions
  namespace :admins do
    root "users#index"
    resources :subjects
    resources :questions
    resources :examinations, only: [:index, :edit, :update]
    resources :users, only: [:index, :show, :destroy] do
      resources :examinations, only: :show
    end
  end
  
  devise_for :users
  devise_scope :user do
    get "sign_out", to: "devise/sessions#destroy"
    get "sign_in", to: "devise/sessions#new"
    get "sign_up", to: "devise/registrations#new"
  end
  
  resources :users, only: :show
  resources :examinations
  get "/examinations/:id/:status", to: "examinations#update", as: :start_examination
end
