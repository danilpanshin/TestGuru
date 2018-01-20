class Test < ApplicationRecord
  has_many :tests_users
  has_many :users, through: :tests_users

  has_many :questions
  belongs_to :category

  belongs_to :author, class_name: 'User', foreign_key: 'user_id'

  scope :beginner, -> { by_level(0..1) }
  scope :intermediate, -> { by_level(2..4) }
  scope :advanced, -> { by_level(5..Float::INFINITY) }

  scope :by_level, -> (level) { where(level: level) }
  #User.tests.by_level(0)

  scope :by_category, -> (category) { joins(:category).where(categories: { title: category }) }
  Test.by_category('Backend').order(title: :desc).pluck(:title)

  def self.ordered_test_titles_by_category(category)
    Test.joins('JOIN categories ON categories.id = tests.category_id')
        .where('categories.title = :category', category: category)
        .order('tests.title DESC')
        .pluck('tests.title')
  end

  validates :title, presence: true,
                    uniqueness: { scope: :level,
                    message: "There can be only one test with this name and level" }

  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
