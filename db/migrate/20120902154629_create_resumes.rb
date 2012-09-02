class CreateResumes < ActiveRecord::Migration
  def change
    create_table :resumes do |t|
      t.string :name
      t.string :gender
      t.date :birth
      t.string :credential
      t.string :phone
      t.string :email
      t.text :evaluation
      t.text :body

      t.timestamps
    end
  end
end
