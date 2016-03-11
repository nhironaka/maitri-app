class User < ActiveRecord::Base
  attr_accessor :password
  #before_save :encrypt_password
  EMAIL_REGEX = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i
  
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email, :on => :create
  validates_presence_of :username, :on => :create
  validates_uniqueness_of :email
  validates_uniqueness_of :username
  validates_length_of :password, :in => 6..20, :on => :create
  validates_length_of :username, :in => 6..20, :on => :create
  validates :email, :format => EMAIL_REGEX

  def initialize(attributes = {})
    super # must allow the active record to initialize!
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end 
  
  def self.validate_login(username_or_pw, password_)
    if EMAIL_REGEX.match(username_or_pw)    
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

