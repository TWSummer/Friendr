class CreateSearchQueries < ActiveRecord::Migration[5.1]
  def change
    create_table :search_queries do |t|
      t.integer :user_id, null: false
      t.integer :min_age
      t.integer :max_age
      t.integer :max_distance
      t.integer :active_within
      t.timestamps
    end

    add_index :search_queries, :user_id
  end
end
