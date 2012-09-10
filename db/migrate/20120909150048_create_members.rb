class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name
      t.string :tel
      t.string :fax
      t.string :address
      t.string :web
      t.string :position
      t.string :logo
      t.boolean :showprimary,:default=>true
      t.timestamps
    end
  end
end
