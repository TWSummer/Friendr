class AddActivityCounterToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :activity_count, :integer
  end
end
