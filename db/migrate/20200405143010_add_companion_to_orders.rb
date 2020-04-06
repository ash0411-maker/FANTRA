class AddCompanionToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :companion, :string
  end
end
