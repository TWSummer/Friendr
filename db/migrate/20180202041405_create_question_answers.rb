class CreateQuestionAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :question_answers do |t|
      t.integer :question_id, null: false
      t.integer :user_id, null: false
      t.integer :question_option_id, null: false
      t.integer :importance, null: false
      t.timestamps
    end

    add_index :question_answers, :question_id
    add_index :question_answers, :user_id
    add_index :question_answers, :question_option_id
  end
end
