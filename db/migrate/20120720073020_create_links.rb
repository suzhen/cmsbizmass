class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :name
      t.string :url
      t.string :logo
      t.string :description
      t.string :user_name
      t.integer :listorder
      t.boolean :disabled

      t.timestamps
    end
  end
end
