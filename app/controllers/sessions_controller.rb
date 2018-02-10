class SessionsController < ApplicationController
  

  def new
  end

  def create
    user = User.find_by(email: params[:email])	

    if user&.authenticate(params[:password])
      session[:user_id] = user.id 
      
      redirect_to cookies[:return_to] || root_path, notice: "Hi, #{current_user.user_name}! welcome back!"
      
    else
      flash.now[:alert] = 'Are you a Guru? Verify your E-mail and password please'
      render :new
    end    	
  end

  def destroy
  	session[:user_id] = nil 
  	redirect_to welcome_path, notice: "Goodbye!"
  end
end
