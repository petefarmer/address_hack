class CreateItems < ActiveRecord::Migration[8.0]
  def change
    create_table :items do |t|
      t.string :item_key, null: false
      t.text :description
      t.string :UPC_key

      t.timestamps
    end

    add_index :items, :item_key, unique: true
    add_index :items, :UPC_key, unique: true
  end
end
