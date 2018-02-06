class Answer < ApplicationRecord
  belongs_to :question
  scope :correct, -> {where(correct: true)}


 # validates :answers_number

  private

  #def answers_number
  #  errors.add(:question, 'wrong number of answers') unless (1..4).include?(question.answers.count)
  #end

end
