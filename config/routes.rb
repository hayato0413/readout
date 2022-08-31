Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :account,         only:   [:show]
  resources :post,            expect: [:index] 
  
  get "/",                    to: 'post#index'
  get "/post/user/:id",       to: 'post#post_user'
  get "/category_index", to: 'post#category_index'
end
