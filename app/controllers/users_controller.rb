class UsersController < ApplicationController  
  
  def user_params
    params.require(:user).permit(:username, :password, :email, :password_confirmation)
  end
  
  def new
    @user=User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "You signed up successfully"
      redirect_to patients_overview_path
    else
      render :action=>'new'
    end
  end
  
  def edit
  end
  
  def login
  end
  
  def valid_login?
    authorized = User.validate_login(params[:username_or_email], params[:login_password])
    if authorized
      redirect_to patients_overview_path
    else
      if params[:username_or_email].blank?
        flash[:error] = "Please enter a username"
      elsif params[:login_password].blank?
        flash[:error] = "Please enter a password"
      else
        flash[:error] = "Invalid username or password"
      end
      render :action=>'login'
    end
  end
  
  def logout
    session[:user_id] = nil
    redirect_to :action => 'login'
  end
  
end