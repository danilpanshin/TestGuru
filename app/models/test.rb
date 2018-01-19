class Test < ApplicationRecord
  has_many :tests_users
  has_many :users, through: :tests_users

  has_many :questions
  belongs_to :category

  belongs_to :author, class_name: 'User', foreign_key: 'user_id'

  #def self.ordered_test_titles_by_category(category)
  #  Test.joins('JOIN categories ON categories.id = tests.category_id')
  #      .where('categories.title = :category', category: category)
  #      .order('tests.title DESC')
  #      .pluck('tests.title')
  #end
end
