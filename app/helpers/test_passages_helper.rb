module TestPassagesHelper
  def number_color(test_passage)
    if test_passage.success_test?
	  @color = 'block_green'
	  'The test passed successfully'
	else
	  @color = 'block_red'	
	  'Test failed'	
	end 
  end	
end
