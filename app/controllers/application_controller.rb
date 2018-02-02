class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
 # rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

 # def rescue_with_question_not_found
  #  render plain: 'Resource was not found'
 # end
end
