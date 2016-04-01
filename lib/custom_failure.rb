class CustomFailure < Devise::FailureApp
  def redirect_url
    "/users/sign_up"
  end

  def respond
    if http_auth?
      http_auth
    else
      redirect_to registration_path
    end
  end
end