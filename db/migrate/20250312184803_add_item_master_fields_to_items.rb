class AddItemMasterFieldsToItems < ActiveRecord::Migration[8.0]
  def change
    add_column :items, :item_type, :string
    add_column :items, :item_subtype, :string
    add_column :items, :order_method, :string
    add_column :items, :price_group, :string
    add_column :items, :product_key, :string
    add_column :items, :commodity_key, :string
    add_column :items, :ABC_key, :string
    add_column :items, :ECCN_code, :string
    add_column :items, :physical_count_days, :integer
    add_column :items, :manufacturer_code, :string
  end
end
