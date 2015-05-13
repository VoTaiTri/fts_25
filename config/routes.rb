Rails.application.routes.draw do
  
  root "static_pages#home"
  get "help" => "static_pages#help"
  get "about" => "static_pages#about"
  get "contact" => "static_pages#contact"
  get "news" => "static_pages#news"

  devise_for :admins
  namespace :admins do
    root "users#index"
    resources :subjects
    resources :questions
    resources :users
  end
  
  devise_for :users
  devise_scope :user do
    get "sign_out", to: "devise/sessions#destroy"
    get "sign_in", to: "devise/sessions#new"
    get "sign_up", to: "devise/registrations#new"
  end
  
  resources :users, only: :show
  resources :examinations, only: [:index, :create]
end
