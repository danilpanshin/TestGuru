class UpdateForeignKeyUserBadges < ActiveRecord::Migration[5.1]
  def up
    remove_foreign_key :user_badges, :badges
    add_foreign_key :user_badges, :badges, on_delete: :cascade
  end

  def down
    remove_foreign_key :user_badges, :badges, on_delete: :cascade
    add_foreign_key :user_badges, :badges
  end
end
