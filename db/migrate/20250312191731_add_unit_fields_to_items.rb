class AddUnitFieldsToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :purchase_unit, :string, default: 'kg'
    add_column :items, :sales_unit, :string, default: 'kg'
    add_column :items, :production_unit, :string, default: 'kg'
  end
end
