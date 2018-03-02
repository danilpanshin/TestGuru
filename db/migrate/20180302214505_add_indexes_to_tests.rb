class AddIndexesToTests < ActiveRecord::Migration[5.1]
  def change
    add_index :tests, :user_id
    add_index :tests, :category_id
  end
end
