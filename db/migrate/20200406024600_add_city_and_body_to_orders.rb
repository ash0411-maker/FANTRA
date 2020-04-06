class AddCityAndBodyToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :tour_city, :string
  end
end
