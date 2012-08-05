class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.string :title
      t.text :description
      t.integer :owner, limit: 1
      t.integer :deal, limit: 1
      t.integer :type, limit: 1
      t.integer :purpose, limit: 1
      t.float :area
      t.integer :floor, limit: 1
			t.integer :rooms_number, limit: 1
      t.boolean :water
      t.boolean :light
      t.boolean :bathroom
      t.boolean :heating
      t.string :image
      t.integer :region, limit: 1
      t.integer :city, limit: 1
      t.references :user

      t.timestamps
    end
    add_index :ads, :user_id
  end
end
