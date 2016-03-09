class UsersController < ApplicationController  
  def new
    @user = User.new 
  end
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "You signed up successfully"
      redirect_to patients_overview_path
    else
      flash[:notice] = "Form is invalid"
    end
  end
end