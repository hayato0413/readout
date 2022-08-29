Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :account,       only:   [:show]
  resources :post,          expect: [:index] 
  
  get "/",                  to: 'post#index'
end
