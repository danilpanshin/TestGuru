class AddIndexUniqueToTitleLevelToTest < ActiveRecord::Migration[5.1]
  def change
    add_index :tests, %i[title level], unique: true
  end
end
