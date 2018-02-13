class RemoveAuthorFromTests < ActiveRecord::Migration[5.1]
  def change
    remove_column :tests, :author
  end
end
