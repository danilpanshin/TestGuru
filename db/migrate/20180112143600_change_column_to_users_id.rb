class ChangeColumnToUsersId < ActiveRecord::Migration[5.1]
  def change
    change_column(:users, :user_id, :integer)
  end
end
