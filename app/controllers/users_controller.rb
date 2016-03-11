class UsersController < ApplicationController  
  
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
  
  def new
    @user=User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "You signed up successfully"
      redirect_to patients_overview_path
      #render 'new'
    else
      if !User.where(email: params[:user][:email]).nil?
        flash[:error] = "You have already signed up with this email"
      else
        flash[:error] = "Your passwords must be at least 6 characters long"
      end
      render "new"
      
    end
  end
  
  def edit
  end
  
  def login
  end
  
  def valid_login?
    authorized = User.validate_login(params[:username], params[:password])
    if authorized
      redirect_to patients_overview_path
    else
      flash[:error] = "Invalid Username or Password"
      render 'login'
    end
  end
  
  def logout
    session[:user_id] = nil
    redirect_to :action => 'login'
  end
  
end