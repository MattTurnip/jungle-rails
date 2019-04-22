class User < ActiveRecord::Base
  has_many :reviews
  
  has_secure_password
  validates :password, length: { minimum: 6 }, on: :create
  validates :name, :presence => true
  validates :email, :presence => true, 
            :uniqueness => { :case_sensitive => false }
  # validates :password_confirmation, :presence => true, on: :create
  # validates :password, confirmation: true, :presence => true, on: :create
end
