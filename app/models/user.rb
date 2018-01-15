class User < ApplicationRecord
  def user_tests_by_level (level)
    Test.joins('JOIN users_tests ON tests.id = users_tests.test_id')
         .where('tests.level = :level AND users_tests.user_id = :user_id',
                level: level, user_id: id)
  end
end
