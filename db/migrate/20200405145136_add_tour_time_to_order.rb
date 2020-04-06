class AddTourTimeToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :tour_time, :string
  end
end
