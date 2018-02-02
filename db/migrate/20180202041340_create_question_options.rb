class CreateQuestionOptions < ActiveRecord::Migration[5.1]
  def change
    create_table :question_options do |t|
      t.integer :question_id, null: false
      t.text :body, null: false
      t.timestamps
    end

    add_index :question_options, :question_id
  end
end
