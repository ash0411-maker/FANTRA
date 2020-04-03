class CreateTourPhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :tour_photos do |t|
      t.string :image_id
      t.integer :tour_id

      t.timestamps
    end
  end
end
