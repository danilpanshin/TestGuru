class Test < ApplicationRecord
  has_many :test_passages, dependent: :delete 
  has_many :users, through: :test_passages
  has_many :questions
  belongs_to :category, optional: true
  belongs_to :author, class_name: 'User', foreign_key: 'user_id', optional: true

  scope :beginner, -> { by_level(0..1) }
  scope :intermediate, -> { by_level(2..4) }
  scope :advanced, -> { by_level(5..Float::INFINITY) }

  scope :by_level, -> (level) { where(level: level) }

  scope :by_category, -> (category) { joins(:category).where(categories: { title: category }) }


  def self.ordered_test_titles_by_category(category)
    Test.by_category(category).order(title: :desc).pluck(:title)
    #Test.joins('JOIN categories ON categories.id = tests.category_id')
    #    .where('categories.title = :category', category: category)
    #    .order('tests.title DESC')
    #    .pluck('tests.title')
  end


  validates :title, presence: true,
                    uniqueness: { scope: :level,
                    message: "There can be only one test with this name and level" }

  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  validates :timer, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
