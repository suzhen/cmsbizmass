class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.string :name
      t.string :type
      t.string :setting
      t.date :startdate
      t.date :enddate
      t.integer :hits
      t.integer :clicks
      t.integer :listorder
      t.boolean :disabled

      t.timestamps
    end
  end
end
