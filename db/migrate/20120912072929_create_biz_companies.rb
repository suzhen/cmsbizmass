class CreateBizCompanies < ActiveRecord::Migration
  def change
    create_table :biz_companies do |t|
      t.string :name
      t.string :logo
      t.text :body

      t.timestamps
    end
  end
end
