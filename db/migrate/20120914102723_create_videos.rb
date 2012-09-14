class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :name
      t.string :editor
      t.integer :hits
      t.text :body
      t.string :thumb
      t.boolean :showprimary

      t.timestamps
    end
  end
end
