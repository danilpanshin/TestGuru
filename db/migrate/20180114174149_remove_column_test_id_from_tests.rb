class RemoveColumnTestIdFromTests < ActiveRecord::Migration[5.1]
  def change
    remove_column(:tests, :test_id)
  end
end
