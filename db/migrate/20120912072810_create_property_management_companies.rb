class CreatePropertyManagementCompanies < ActiveRecord::Migration
  def change
    create_table :property_management_companies do |t|
      t.string :name
      t.string :local
      t.text :body

      t.timestamps
    end
  end
end
