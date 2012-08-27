class AddENameToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :ename, :string

  end
end
