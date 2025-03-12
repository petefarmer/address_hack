class AddSerialLotFieldsToItems < ActiveRecord::Migration[8.0]
  def change
    add_column :items, :track_serial_lot, :string
    add_column :items, :auto_lot_issue_method, :string
    add_column :items, :default_lot_size, :decimal
    add_column :items, :storage_condition, :string
  end
end
