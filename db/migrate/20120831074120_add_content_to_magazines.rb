class AddContentToMagazines < ActiveRecord::Migration
  def change
    add_column :magazines, :body_title, :string

    add_column :magazines, :body, :text

  end
end
