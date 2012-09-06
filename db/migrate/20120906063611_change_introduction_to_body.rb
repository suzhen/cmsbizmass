class ChangeIntroductionToBody < ActiveRecord::Migration
  def up
    remove_column :employing_units, :introduction
    add_column :employing_units,:body,:text 
  end

  def down
   remove_column :employing_units,:body
  end
end
