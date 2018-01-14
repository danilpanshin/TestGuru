class Test < ApplicationRecord
  def self.ordered_test_titles_by_category(category)
    Test.joins('JOIN categories ON categories.id = tests.category_id')
        .where('categories.title = :category', category: category)
        .order('tests.title DESC')
        .pluck('tests.title')
  end
end
