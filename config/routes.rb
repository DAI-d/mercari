Rails.application.routes.draw do
devise_for :users

  root 'products#index'
  
# user関係
  get 'users/logout'
  get 'users/profile'
  get 'users/phone_number'
  get 'users/mail_password'
  get 'users/personal_information'
  get 'users/credit'
  get 'users/newuser3'
  get 'users/credit_create'
# user関係

  resources :products, only: [:index, :show] 
  resources :users, only: [:index, :edit, :update]
  
end
