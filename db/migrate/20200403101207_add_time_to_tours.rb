class AddTimeToTours < ActiveRecord::Migration[5.2]
  def change
    add_column :tours, :time, :string
  end
end
