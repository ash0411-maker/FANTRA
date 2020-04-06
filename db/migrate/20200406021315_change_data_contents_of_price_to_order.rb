class ChangeDataContentsOfPriceToOrder < ActiveRecord::Migration[5.2]
  def change
  	change_column :orders, :contents_of_price, :string
  end
end
