class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :title
      t.string :style
      t.text :description
      t.integer :listorder
      t.string :status
      t.string :user_name
      t.string :url
      t.references :article
      t.references :category
      t.references :pic_space
      t.string :picture
      t.timestamps
    end
  end
end
