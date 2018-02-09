class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
   # rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  # def rescue_with_question_not_found
  #  render plain: 'Resource was not found'
  # end
  #before_action :set_return_to_page


  helper_method :current_user,
                :logged_in?,
                :user_name 

  private

  def authenticate_user!
    unless current_user
      set_return_to_page      	
      redirect_to login_path, alert: 'Are you a Guru? Verify your E-mail and password please'
    end

  end

  def current_user
  	@current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]  	
  end

  def logged_in?
    current_user.present?	
  end

  def set_return_to_page
  	cookies[:return_to] ||= request.original_fullpath
  end	

  def user_name
    current_user.email.split('@').first.capitalize
  end
   
end
