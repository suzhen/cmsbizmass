class CreateEnterprises < ActiveRecord::Migration
  def change
    create_table :enterprises do |t|
      t.string :name
      t.string :province
      t.string :city
      t.string :store_name
      t.string :address
      t.float :longitude
      t.float :latitude
      t.string :tel
      t.string :kind
      t.text :remark

      t.timestamps
    end
  end
end
