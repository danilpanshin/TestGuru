class Question < ApplicationRecord
  belongs_to :test
  has_many :answers

  scope :right, -> {where(correct: true)}

  validates :body, presence: true

  validate :answers_number

  private

  def answers_number
    errors.add(:answers, 'wrong number of answers') if questions.answers.size > 4 && questions.answers.size < 1
  end

end
