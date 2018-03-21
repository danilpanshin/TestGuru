class UpdateForeignKeyTestPassages < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :test_passages, :tests, on_delete: :nullify
  end
end
