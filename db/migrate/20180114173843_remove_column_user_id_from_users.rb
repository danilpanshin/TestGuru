class RemoveColumnUserIdFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column(:users, :user_id)
  end
end
