class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.integer :user_id, null: false
      t.string :name, null: false
      t.date :birthdate, null: false
      t.string :gender, null: false
      t.float :latitude
      t.float :longitude
      t.text :about_me
      t.text :looking_for
      t.string :primary_img_url
      t.timestamps
    end

    add_index :profiles, :user_id, unique: true
  end
end
