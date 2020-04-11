class AddDeletedAtToTourist < ActiveRecord::Migration[5.2]
  def change
    add_column :tourists, :deleted_at, :datetime
    add_index :tourists, :deleted_at
  end
end
