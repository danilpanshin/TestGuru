class DropTableUsersTests < ActiveRecord::Migration[5.1]
  def change
    drop_table(:users_tests)
  end
end
