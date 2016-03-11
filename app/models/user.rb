class User < ActiveRecord::Base
  #before_save :encrypt_password

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email, :on => :create
  validates_presence_of :username, :on => :create
  validates_uniqueness_of :email
  validates_uniqueness_of :username

  def initialize(attributes = {})
    super # must allow the active record to initialize!
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end 
  
  def self.validate_login(username_or_pw, password_)
    if username_or_pw.match(/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i)
      user = User.where(email: username_or_pw, password: password_).first
    else
      user = User.where(username: username_or_pw, password: password_).first
    end
    if user && user.password == password_
      return user
    else
      return false
    end
  end

end

