class AddFormattedhtmlToEmployingUnit < ActiveRecord::Migration
  def change
    add_column :employing_units, :formatted_html, :text

  end
end
