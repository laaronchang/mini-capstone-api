class AddColumnToImages < ActiveRecord::Migration[7.1]
  def change
    add_column :images, :product_id, :string
  end
end
