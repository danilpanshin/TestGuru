class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.string :body, null: false, default: "0"
      t.boolean :correct, null: false, default: false
      t.integer :question_id

      t.timestamps
    end
  end
end
