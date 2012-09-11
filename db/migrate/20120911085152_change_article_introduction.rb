class ChangeArticleIntroduction < ActiveRecord::Migration
  def change
   change_column :articles,:introduction,:text
  end
end
