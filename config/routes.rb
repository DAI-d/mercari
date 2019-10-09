Rails.application.routes.draw do
devise_for :users

  root 'products#index'
  get 'tests/credit_create'
  get 'tests/credit'
  get 'tests/index'
  get 'tests/newuser3'
  get 'tests/mypage_profile'
  get 'tests/phone_number'
# user関係
  get 'users/logout'
  get 'users/profile'
# user関係

  resources :products, only: [:index, :show] 
  resources :users, only: [:index, :edit, :update]
  
end
