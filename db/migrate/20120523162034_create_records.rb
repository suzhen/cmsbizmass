class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.text :body
      t.text :formatted_html
      t.string :category
      t.string :content
      t.timestamps
    end
  end
end
