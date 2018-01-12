class User < ApplicationRecord
  def sort_level (level)
    test = Test.joins('JOIN users_tests ON tests.test_id = users_tests.test_id')
        .where('tests.level = :level, level: level')
  end
end
