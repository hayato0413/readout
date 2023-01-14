Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do 
    post 'guest_sign_in' =>  'users/sessions#guest_sign_in'
  end 
  resources :account,                   only:   [:show]

  resources :post,                      expect: [:index] do
    resource :favorites,                  only: [:create, :destroy]
  end
  
  get "/",                              to: 'post#index',            as: :root
  get "/post/user/:id",                 to: 'post#post_user',        as: :post_post_user
  get "/category_index",                to: 'post#category_index',   as: :post_category_index
  get "/post/category/:id",             to: 'post#category' ,        as: :post_category
  get "/post/:id/favorites_list",       to: 'post#favorite',         as: :post_favorite
  get 'search',                         to: 'post#search',           as: :post_search
  get '/lanking',                       to: 'post#lanking',          as: :post_lanking
end
