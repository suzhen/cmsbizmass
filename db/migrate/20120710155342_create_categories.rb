class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.string :symbol
      t.string :ctype
      t.integer :parent_id,:default=>0
      t.string :description
      t.integer :listorder,:default=>0
      t.string :arrparentid
      t.string :arrchildid,:default=>nil
      t.integer :hits
      t.string :style
      t.string :path
      t.string :image
      t.string :setting
      t.string :status

      t.timestamps
    end
  end
end
