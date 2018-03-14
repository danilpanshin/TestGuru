class Admin::TestsController < Admin::BaseController
  
  before_action :set_tests, only: %i[index update_inline]
  before_action :find_test, only: %i[show edit update destroy start update_inline] 
  

  def index
    @tests = Test.all
  end

  def show

  end

  def new
    @test = Test.new
  end

  def edit

  end

  def create
    @test  = Test.new(test_params)
    current_user.authored_tests.new(test_params)
    
    if @test.save
      redirect_to admin_test_path(@test), notice: t('.success')
    else
      render :new
    end
  end

  def update

    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render :edit
    end
  end

  def update_inline
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render :index
    end
  end

  def destroy
    @test.destroy
    redirect_to admin_tests_path
  end
 
  private

  def set_tests
    @tests = Test.all
  end

  def test_params
    params.require(:test).permit(:title, :level, :timer, :category_id)
  end

  def find_test
    @test = Test.find(params[:id])
  end
  

end
