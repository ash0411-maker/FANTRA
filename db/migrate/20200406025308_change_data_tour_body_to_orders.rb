class ChangeDataTourBodyToOrders < ActiveRecord::Migration[5.2]
  def change
  	  	change_column :orders, :tour_body, :text
  end
end
