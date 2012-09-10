class AddThemePictureToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :theme_picture, :string

  end
end
