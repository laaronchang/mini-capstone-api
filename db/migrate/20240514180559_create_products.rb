class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :item_name
      t.integer :item_price
      t.string :image_url
      t.string :item_description

      t.timestamps
    end
  end
end
