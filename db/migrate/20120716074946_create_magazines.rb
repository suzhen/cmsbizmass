class CreateMagazines < ActiveRecord::Migration
  def change
    create_table :magazines do |t|
      t.string :title
      t.date :public_date
      t.string :user_name
      t.integer :download
      t.text :remark
      t.string :elecpdf #电子版PDF
      t.string :cover #杂志封面
      t.references :comment
      t.timestamps
    end
  end
end
