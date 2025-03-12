class AddPurchasableAndSaleableToItems < ActiveRecord::Migration[8.0]
  def change
    add_column :items, :purchasable, :boolean, default: false, null: false
    add_column :items, :saleable, :boolean, default: false, null: false
  end
end
