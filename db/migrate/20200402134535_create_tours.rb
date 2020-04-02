class CreateTours < ActiveRecord::Migration[5.2]
  def change
    create_table :tours do |t|
      t.integer :genre_id, null: false
      t.integer :guide_id, null: false
      t.integer :city_id, null: false
      t.string :title, null: false
      t.text :body, null: false
      t.integer :capacity, null: false
      t.integer :price, null: false
      t.string :contents_of_price, null: false

      t.timestamps
    end
  end
end
