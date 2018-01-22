class Question < ApplicationRecord
  belongs_to :test
  has_many :answers

  scope :correct, -> {where(correct: true)}

  validates :body, presence: true

end
