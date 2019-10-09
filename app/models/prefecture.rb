class Prefecture < ApplicationRecord
  #productste-buruto
  has_many :products
  has_many :users
end
