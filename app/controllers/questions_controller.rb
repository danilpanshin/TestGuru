class QuestionsController < ApplicationController
before_action :find_question, only: [:show]
before_action :find_test, only: [:index, :destroy, :create]



  def index
    render plain: @test.questions.inspect
  end

  def show

  end

  def create
    @question = @test.questions.new(question_params)
    render plain: @question.inspect
  end

  def destroy
    @question = @test.questions.find(params[:id])
    @question.destroy
    render plain: "Question has been destoyed"
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body, :theme)
  end

end

