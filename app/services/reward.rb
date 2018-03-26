class Reward
  
  def initialize (user)
    @user = user 
    #@badge_level = Badge.where("rule = 'level = 2'")
  end
  
  def check_rule

    if @user.test_passages.last.success_test? && @user.tests.where("title = ?", @user.tests.last.title).count == 1

      @user.badges << Badge.where("title = 'first blood'")
      
    end

  end

  #current_user.tests.where(b.rule).uniq.count == Test.where(b.rule).count


end