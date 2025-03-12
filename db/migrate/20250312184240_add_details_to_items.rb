class AddDetailsToItems < ActiveRecord::Migration[8.0]
  def change
    add_column :items, :manufacturer, :string
    add_column :items, :manufacturer_part_number, :string
    add_column :items, :stock_unit, :string
    add_column :items, :minimum_stock, :integer
    add_column :items, :serial_tracked, :boolean
    add_column :items, :lot_tracked, :boolean
  end
end
