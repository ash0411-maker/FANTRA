class AddAdminSalesAndGuideSalesToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :admin_sales, :integer
    add_column :orders, :guide_sales, :integer
  end
end
