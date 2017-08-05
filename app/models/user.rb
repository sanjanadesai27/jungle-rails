class User < ActiveRecord::Base
  
  has_many :orders
  has_secure_password
  has_many :reviews

end
