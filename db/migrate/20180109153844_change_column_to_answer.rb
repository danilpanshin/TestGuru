class ChangeColumnToAnswer < ActiveRecord::Migration[5.1]
  def change
    change_column(:answers, :correct, :boolean)
  end
end
