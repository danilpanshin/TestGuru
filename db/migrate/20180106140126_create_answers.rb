class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.integer :answer
      t.string :correct

      t.timestamps
    end
  end
end
