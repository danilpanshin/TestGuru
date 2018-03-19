class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_validation :before_validation_set_next_question, on: :update


  SUCCESS_RATE = 85


  def completed?
  	current_question.nil?
  end

  def spent_time
    (Time.now - self.created_at).round 1 
  end

  def time_is_up?
    (Time.now - self.created_at) > self.test.timer
  end


  def accept!(answer_ids)
  	if correct_answer?(answer_ids)
  	  self.correct_questions += 1
    end
    save!
  end

  def number_of_question
    test.questions.index(current_question) + 1
  end


  def percent_of_complition
    (correct_questions.to_f/test.questions.count*100).round 2
  end

  def success_test?
  	percent_of_complition > SUCCESS_RATE
  end

  def time
    if self.test.timer.present?
      self.created_at + self.test.timer.seconds 
    end
    
  end



  private

  def before_validation_set_first_question
  	self.current_question = test.questions.first if test.present?
  end

  
  def correct_answer?(answer_ids)
    correct_answers_count = correct_answers.count

    (correct_answers_count == correct_answers.where(id: answer_ids).count) &&
      correct_answers_count == answer_ids.count
  end

  def correct_answers
  	current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first 
  end

  def before_validation_set_next_question
    self.current_question = next_question
  end

end
