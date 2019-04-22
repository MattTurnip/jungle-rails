class User < ActiveRecord::Base
  has_many :reviews
  
  has_secure_password
  validates :password, length: { minimum: 6 }, on: :create
  validates :name, :presence => true
  validates :email, :presence => true, 
            :uniqueness => { :case_sensitive => false }


  def authenticate_with_credentials(email, password)
    @user = User.find_by_email(email: email)
    if @user && user.authenticate(password)
      @user
    else
      nil
    end
  end

end
