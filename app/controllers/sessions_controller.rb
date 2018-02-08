class SessionsController < ApplicationController
  
  before_action :set_coock_home_page, only: :create  

  def new
  end

  def create
    user = User.find_by(email: params[:email])	

    if user&.authenticate(params[:password])
      session[:user_id] = user.id 
      
      redirect_to cookies[:home_page]
      
    else
      flash.now[:alert] = 'Are you a Guru? Verify your E-mail and password please'
      render :new
    end    	
  end

  def destroy
  	session[:user_id] = nil 
  	redirect_to welcome_path
  end
end
