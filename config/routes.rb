Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'products#index'
  get 'tests/credit_create'
  get 'tests/credit'
  get 'tests/index'
  get 'tests/newuser3'
  get 'tests/mypage_profile'
  get 'tests/phone_number'

  resources :products, only: [:index, :show] 

end
