Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do 
    post 'guest_sign_in' =>  'users/sessions#guest_sign_in'
  end 
  resources :account,                   only:   [:show]

  resources :post,                      expect: [:index] do
    resource :favorites,                  only: [:create, :destroy]
  end
  
  get "/",                              to: 'post#index'
  get "/post/user/:id",                 to: 'post#post_user'
  get "/category_index",                to: 'post#category_index'
  get "/post/category/:id",             to: 'post#category'
  get "/post/:id/favorites_list",       to: 'post#favorite'
  get 'search',                         to: 'post#search'
end
