class RemoveColumnThemeFromQuestions < ActiveRecord::Migration[5.1]
  def change
    remove_column(:questions, :theme)
  end
end
