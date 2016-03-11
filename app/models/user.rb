class User < ActiveRecord::Base
  attr_accessor :username, :email, :password, :password_confirmation
  @email_regex = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i
    
  validates :username, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
  validates :email, :presence => true, :uniqueness => true, :format => @email_regex
  validates :password, :confirmation => true
  validates_length_of :password, :in => 6..20, :on => :create
  
  def self.validate_login(username_or_pw, password_)
    if @email_regex.match(username_or_pw)    
      user = User.where(email: username_or_pw).first
    else
      user = User.where(user: username_or_pw).first
    end
    if user && user.password == password_
      return user
    else
      return false
    end
  end

end