class QuestionsController < ApplicationController
before_action :find_question, only: [:show]
before_action :find_test, only: [:index, :destroy]

rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = @test.questions
    render 'index'
  end

  def show
    render 'show'
  end

  def create
    question = Question.new(question_params)
    question.save
    #render plain: question.inspect
    redirect_to action: "index", test_id: 4
  end

  def destroy
    @questions = @test.questions.find(params[:id])
    @questions.destroy
    redirect_to action: "index", test_id: 4
    #redirect_to test_questions_path(@question)
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @questions = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body, :theme, :test_id)
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found'
  end

end

