class Answer < ApplicationRecord
  belongs_to :question

  validate :answers_number

  private

  def answers_number
    errors.add(:question, 'wrong number of answers') if !(1..4).include?(question.answers.count)
  end

end
