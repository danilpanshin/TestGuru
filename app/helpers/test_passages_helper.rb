module TestPassagesHelper
  def test_result(test_passage)
    if test_passage.success_test?
	  'The test passed successfully'
	else
	  'Test failed'	
	end 
  end

  def color(test_passage)
    if test_passage.success_test?
	  'block_green'	  
	else
	  'block_red'	  	
	end 
  end		
end


