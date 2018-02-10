class UsersController < ApplicationController
  def new
    @user = User.new	
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id	
      redirect_to welcome_path, notice: "Hello, #{current_user.user_name}! Are you ready to become a guru?"
    else
      render :new
    end
  end

  private

  def user_params
  	params.require(:user).permit(:email, :password, :password_confirmation)
  end

end
