class CreateBadges < ActiveRecord::Migration[5.1]
  def change
    create_table :badges do |t|
      t.string :title
      t.string :img_url
      t.string :rule
      

      t.timestamps
    end
  end
end
