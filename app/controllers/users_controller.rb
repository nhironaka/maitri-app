class UsersController < ApplicationController  
    
  def users_params
    params.require(:user).permit(:user_name, :password, :email)
  end
  
  def create
    @user = User.create!(params[:user])
    if @user.save
      flash[:notice] = "You signed up successfully"
      redirect_to patients_overview_path
    else
      flash[:error] = "Form is invalid"
    end
  end
end