class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :content
      t.references :tourist, foreign_key: true
      t.references :tour, foreign_key: true

      t.timestamps
    end
  end
end
