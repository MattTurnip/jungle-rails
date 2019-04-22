class User < ActiveRecord::Base
  has_many :reviews

  before_save { self.email.downcase, self.email.strip }
  
  has_secure_password
  validates :password, length: { minimum: 6 }, on: :create
  validates :name, :presence => true
  validates :email, :presence => true, 
            :uniqueness => { :case_sensitive => false }


  def self.authenticate_with_credentials(email, password)
    email = email.downcase
    email = email.strip
    @user = User.find_by_email(email)
    if @user && @user.authenticate(password)
      @user
    else
      nil
    end
  end

end
