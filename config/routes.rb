Rails.application.routes.draw do
  get 'homes/index'
  get '/about' => "homes#about"
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "homes#index"
  resources :books
  resources :users
end
