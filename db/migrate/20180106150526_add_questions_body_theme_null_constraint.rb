class AddQuestionsBodyThemeNullConstraint < ActiveRecord::Migration[5.1]
  def change
    change_column_null(:questions, :body, false)
    change_column_null(:questions, :theme, false)
  end
end
