class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title #新闻标题
      t.string :short_title #新闻列表标题
      t.string :introduction #新闻概况
      t.string :author #作者
      t.string :eidtor_id #编辑ID
      t.string :eidtor_name #编辑姓名
      t.string :source #新闻来源
      t.datetime :source_date #来源时间
      t.boolean :published,:default=>true #是否发布
      t.datetime :pubdate #发布时间
      t.boolean :top #置顶标记
      t.integer :hits,:default=>1 #点击次数
      t.string :status,:default=>"normal" #新闻状态
      t.integer :listorder,:defalut=>0
      t.references :category
      t.timestamps
    end
  end
end
