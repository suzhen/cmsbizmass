class AddListorderToMagazines < ActiveRecord::Migration
  def change
    add_column :magazines,:listorder,:integer,:default=>0

  end
end
