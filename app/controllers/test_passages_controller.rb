class TestPassagesController < ApplicationController
  
  before_action :authenticate_user!
	before_action :set_test_passage, only: %i[show update result gist]
  around_action :check_time, only: %i[show]

  TIME = Time.now 
  
  def show
    #@time = @test_passage.time
       
  end

  def check_time
    @time = @test_passage.time 

    if @time.present? && Time.parse((@time).to_s) < Time.now
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else      
      render :show
    end   
  end

  

  def result
    
  end
    
  def update
  	@test_passage.accept!(params[:answer_ids])
    
    @time = @test_passage.time
     

    if @test_passage.completed? || (@time.present? && Time.parse((@time).to_s) < Time.now)
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else    	
      render :show
    end

  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question)

    result.call

    if result.success? 
      
      current_user.gists.create(question: @test_passage.current_question, gist_url: result.gist_url)
      flash_options = { notice: t('.success', url: result.gist_url) }
    else
      flash_options = { alert: t('.failure') } 
    end
    redirect_to @test_passage, flash_options   
    
  end


  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

end
