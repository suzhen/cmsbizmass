class AddLogoAndShowFlagToEmployingUnits < ActiveRecord::Migration
  def change
    add_column :employing_units, :logo, :string

    add_column :employing_units, :showprimary, :boolean

  end
end
