class CreatePicSpaces < ActiveRecord::Migration
  def change
    create_table :pic_spaces do |t|
      t.string :name
      t.string :symbol
      t.integer :maxnum

      t.timestamps
    end
  end
end
