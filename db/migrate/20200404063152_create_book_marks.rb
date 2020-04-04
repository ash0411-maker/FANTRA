class CreateBookMarks < ActiveRecord::Migration[5.2]
  def change
    create_table :book_marks do |t|
      t.integer :tourist_id
      t.integer :tour_id

      t.timestamps
    end
  end
end
