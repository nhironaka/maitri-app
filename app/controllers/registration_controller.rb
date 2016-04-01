class RegistrationController < Devise::RegistrationsController
  def add_user
    User.create!(:username=>params[:username], :email=>params[:email], :password=>[:password], :password_confirmation=>[:password_confirmation])
    redirect_to "/patients/overview"
  end
end