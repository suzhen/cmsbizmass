class CreateArticleBodies < ActiveRecord::Migration
  def change
    create_table :article_bodies do |t|
      t.string :caption #文章大标题
      t.string :short_caption #文章小标题
      t.text :body
      t.text :formatted_html
      t.references :article
      t.timestamps
    end
  end
end
