class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.string :name
      t.string :kind
      t.string :setting
      t.date :startdate,:default=>Time.now
      t.date :enddate
      t.integer :hits
      t.integer :clicks,:default=>0
      t.integer :listorder,:default=>0
      t.boolean :disabled
      t.string :poster
      t.references :ad_space
      t.timestamps
    end
  end
end
