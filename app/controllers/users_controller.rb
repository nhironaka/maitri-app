class UsersController < ApplicationController  
    
  def users_params
    params.require(:user).permit(:user_name, :password, :email)
  end
  
  def new
  end
  
  def create
    @user = User.create!(params[:user])
    if @user.save
      flash[:notice] = "You signed up successfully"
      render "overview"
    else
      flash[:error] = "Form is invalid"
    end
  end
  
end