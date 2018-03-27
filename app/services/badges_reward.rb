class BadgesReward
  
  def initialize (test_passage)
    @test_passage = test_passage
    @user = @test_passage.user
    @badge_first_try = Badge.where("title = 'Hit the first time'")
    @badge_backend = Badge.where("title = 'Backender'").first  
    @badge_first_level = Badge.where("title = 'Lord of the first level'").first
  end
  
  def call

    if test_passed_on_the_first_try? && backender? && first_level_all_tests?

      @user.badges << @badge_first_try
      @user.badges << @badge_backend
      @user.badges << @badge_first_level

    elsif test_passed_on_the_first_try? && backender?

      @user.badges << @badge_first_try
      @user.badges << @badge_backend

    elsif test_passed_on_the_first_try? && first_level_all_tests?

      @user.badges << @badge_first_try
      @user.badges << @badge_first_level

    elsif backender? && first_level_all_tests?

      @user.badges << @badge_backend
      @user.badges << @badge_first_level

    elsif test_passed_on_the_first_try?

      @user.badges << @badge_first_try

    elsif first_level_all_tests?

      @user.badges << @badge_first_level         

    elsif backender?

      @user.badges << @badge_backend   

    end

    def badge_success?
      test_passed_on_the_first_try? || backender? || first_level_all_tests?
    end  

  end  

  private

  def test_passed_on_the_first_try?
    @test_passage.success_test? && @user.tests.where("title = ?", @test_passage.test.title).count == 1
  end

  def backender?
    @test_passage.success_test? && @user.tests.where(@badge_backend.rule).uniq.count == Test.where(@badge_backend.rule).count  
  end

  def first_level_all_tests?
    @test_passage.success_test? && @user.tests.where(@badge_first_level.rule).uniq.count == Test.where(@badge_first_level.rule).count
  end
end