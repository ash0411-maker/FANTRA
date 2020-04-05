class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|

      t.integer "tourist_id", null: false
      t.integer "tour_id", null: false
      t.integer "guide_id", null: false
      t.string "tour_title", null: false
      t.string "tour_body", null: false
      t.integer "price", null: false
      t.integer "contents_of_price", null: false
      t.integer "capacity", null: false
      t.integer "tour_body", null: false
      t.integer "total_people", null: false

      t.timestamps
    end
  end
end