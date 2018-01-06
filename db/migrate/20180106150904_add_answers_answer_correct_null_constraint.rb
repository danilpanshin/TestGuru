class AddAnswersAnswerCorrectNullConstraint < ActiveRecord::Migration[5.1]
  def change
    change_column_null(:answers, :answer, false)
    change_column_null(:answers, :correct, false)
  end
end
