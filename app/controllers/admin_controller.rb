class AdminController < ApplicationController

 before_filter :authenticate_user!, only: [:index]
 before_filter :is_admin, only: [:index]

 def index
 end

 private

  def is_admin
  if user_signed_in?
   if current_user.admin?
     true
   else
     redirect_to home_index_path
   end
  else
    redirect_to login_path
  end
 end

end
