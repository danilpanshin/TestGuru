class ChangeColumnToUsers < ActiveRecord::Migration[5.1]
  def change
    rename_column(:users, :tests, :user_id)
  end
end
