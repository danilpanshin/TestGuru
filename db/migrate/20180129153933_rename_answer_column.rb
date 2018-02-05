class RenameAnswerColumn < ActiveRecord::Migration[5.1]
  def change
  	rename_column(:answers, :answer, :body)
  end
end
