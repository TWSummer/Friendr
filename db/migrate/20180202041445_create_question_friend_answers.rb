class CreateQuestionFriendAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :question_friend_answers do |t|
      t.integer :question_answer_id
      t.integer :question_option_id
      t.timestamps
    end

    add_index :question_friend_answers, :question_answer_id
    add_index :question_friend_answers, :question_option_id
  end
end
