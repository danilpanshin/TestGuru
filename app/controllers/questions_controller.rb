class QuestionsController < ApplicationController

before_action :authenticate_user!
before_action :find_question, only: %i[show edit update destroy]
before_action :find_test, only: %i[create new]


  def show

  end

  def new
    @question = @test.questions.new
  end

  def edit

  end

  def create
    @question = @test.questions.new(question_params)

    if @question.save
      redirect_to controller: 'tests', action: 'show', id: @question.test_id
    else
      render :new
    end
  end

  def update

    if @question.update(question_params)
      redirect_to controller: 'tests', action: 'show', id: @question.test_id
    else
      render :new
    end
  end

  def destroy

    @question.destroy

    redirect_to controller: 'tests', action: 'show', id: @question.test_id
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

end

