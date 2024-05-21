class ChangePrice < ActiveRecord::Migration[7.1]
  def change
    change_column :products, :item_price, :decimal, precision: 12, scale:2
  end
end
