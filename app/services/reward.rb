class Reward
  
  def initialize (user)
    @user = user 
  end
  
  def check_rule

    if @user.test_passages.last.success_test?
      @user.badges << Badge.where("title = 'first_try'")
      #flash[:notice] = 'Badge!!!'
    end

  end

  #current_user.tests.where(b.rule).uniq.count == Test.where(b.rule).count


end