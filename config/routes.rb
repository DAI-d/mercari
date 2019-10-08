Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'products#index'
  get 'tests/credit_create'
  get 'tests/credit'
  get 'tests/index'
  get 'tests/newuser1'

  resources :products, only: [:index, :show] 

end
