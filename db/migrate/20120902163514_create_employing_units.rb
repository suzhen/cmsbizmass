class CreateEmployingUnits < ActiveRecord::Migration
  def change
    create_table :employing_units do |t|
      t.string :name
      t.text :introduction
      t.string :address
      t.string :tel
      t.string :linkman
      t.string :email

      t.timestamps
    end
  end
end
