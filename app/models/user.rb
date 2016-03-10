class User < ActiveRecord::Base
  attr_accessor :password
  EMAIL_REGEX = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i
  validates :username, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
  validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
  validates :password, :confirmation => true #password_confirmation attr
  validates_length_of :password, :in => 6..20, :on => :create\
  
  #validate :password_match
  
  def login
      flash[:notice] = _("login")
  end
  
  #def password_match
   # if params[:password] != params[:password_confirmation]
    #  errors.add(:password, 'they don\'t match')
    #end
  #end

end