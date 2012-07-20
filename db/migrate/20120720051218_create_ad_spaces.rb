class CreateAdSpaces < ActiveRecord::Migration
  def change
    create_table :ad_spaces do |t|
      t.string :name
      t.string :symbol
      t.string :type
      t.string :path
      t.integer :width
      t.integer :height
      t.string :setting
      t.string :description
      t.integer :items
      t.boolean :disabled,:default=>false

      t.timestamps
    end
  end
end
