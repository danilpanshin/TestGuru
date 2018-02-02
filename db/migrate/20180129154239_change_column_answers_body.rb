class ChangeColumnAnswersBody < ActiveRecord::Migration[5.1]
  def change
  	change_column(:answers, :body, :string)
  end
end
