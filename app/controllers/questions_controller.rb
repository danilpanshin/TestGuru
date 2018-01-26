class QuestionsController < ApplicationController
before_action :find_question, only: [:show]
before_action :find_test, only: [:index, :create, :new]



  def index
    @questions = @test.questions
  end

  def show
    #@question = @test.questions.find(params[:id])
    @question = Question.find(params[:id])
  end

  def new
    @question = @test.questions.new
  end

  def edit
    @question = Question.find(params[:id])
    #@question = @test.questions.find(params[:id])
  end

  def create
    @question = @test.questions.new(question_params)

    if @question.save
      redirect_to action: :index
    else
      render :new
    end
  end

  def update
    @question = Question.find(params[:id])
    #@question = @test.questions.find(params[:id])

    if @question.update(question_params)
      redirect_to action: :index, test_id: @question.test_id
    else
      render :new
    end
  end

  def destroy
    @question = Question.find(params[:id])
    #@question = @test.questions.find(params[:id])
    @question.destroy

    #redirect_to test_questions_path
    redirect_to action: "index", test_id: @question.test_id
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

