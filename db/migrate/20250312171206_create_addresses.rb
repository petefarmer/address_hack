class CreateAddresses < ActiveRecord::Migration[8.0]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :city
      t.string :state
      t.string :postal_code
      t.string :country
      t.references :addressable, polymorphic: true, null: false
      t.string :address_type

      t.timestamps
    end
  end
end
