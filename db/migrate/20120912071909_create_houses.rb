class CreateHouses < ActiveRecord::Migration
  def change
    create_table :houses do |t|
      t.string :name
      t.string :local
      t.string :price
      t.string :kind
      t.string :logo
      t.text :body

      t.timestamps
    end
  end
end
