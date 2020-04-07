class AddOrderStatusToOrders < ActiveRecord::Migration[5.2]
  def change
  	add_column :orders, :status, :integer, defalut: 0
  end
end
