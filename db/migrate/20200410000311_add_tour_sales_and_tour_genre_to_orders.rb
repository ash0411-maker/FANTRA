class AddTourSalesAndTourGenreToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :tour_genre, :string
    add_column :orders, :tour_price, :integer
  end
end
