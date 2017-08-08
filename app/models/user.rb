class User < ActiveRecord::Base
  
  has_many :orders
  has_secure_password
  has_many :reviews
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6}
  
  def self.authenticate_with_credentials(email,password)
    user = User.where(email: email.strip).first
    if user && user.authenticate(password)
      user
    else 
      nil
    end
  end
  
  
  
end
