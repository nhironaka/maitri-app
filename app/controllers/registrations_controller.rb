class RegistrationsController < Devise::RegistrationsController
 before_filter :authenticate_user!
 before_filter :is_administratior?, only: [:new, :create]

 def new
   super
 end

 def create
   super
 end

 private

  def is_administratior?
    blah()
    if user_signed_in? # if user signed
      if current_user.is_admin # if adminstrator return true
        true
      else
       redirect_to root_path
     end
    else
      redirect_to user_session_path
    end
  end
end