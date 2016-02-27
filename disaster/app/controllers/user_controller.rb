class UserController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception

  layout 'application'

  def profile
    if session[:signed_in] == true
		# TODO LOAD DATA
    else
      redirect_to "/login"
    end
  end

  def login
  end

  def post_login
    @username = params[:username]
    @password = params[:password]
    if @username && @password 
      if user = UserInfo.where(username: @username).first
        valid = user.verify_password(@password)
        if valid
         session[:signed_in] = true
         session[:username] = @username
          redirect_to "/profile"
          # TODO: add an invalid password message (change css to visible)
        end
      else 
        # TODO: or reload with invalid username error message
        redirect_to "/register"
      end
    end
     
  end


  def logout
    session[:signed_in] = false
    session[:username] = "My account"
    redirect_to "/login"

    	# redirect_to "/home"

  end

end
