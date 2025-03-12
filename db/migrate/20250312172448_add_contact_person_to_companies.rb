class AddContactPersonToCompanies < ActiveRecord::Migration[8.0]
  def change
    add_column :companies, :contact_person, :string
  end
end
