class DemoUserFlag < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :demo, :boolean
    add_index :users, :demo
  end
end
