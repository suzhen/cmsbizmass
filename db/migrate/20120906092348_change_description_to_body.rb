class ChangeDescriptionToBody < ActiveRecord::Migration
  def up
    remove_column :jobs, :description
    add_column :jobs,:body,:text 
    add_column :jobs,:formatted_html,:text

  end

  def down
   remove_column :jobs,:body
   remove_column :jobs,:formatted_html,:text
  end
end
