class ConvertColumnNamesToLowercase < ActiveRecord::Migration[7.1]
  def change
    rename_column :items, :UPC_key, :upc_key
    rename_column :items, :ABC_key, :abc_key
    rename_column :items, :ECCN_code, :eccn_code
  end
end
