class CreateTests < ActiveRecord::Migration[5.1]
  def change
    create_table :tests do |t|
      t.string :title, null: false
      t.integer :level, default: 0
      t.integer :category_id
      t.integer :user_id

      t.timestamps
    end
  end
end
