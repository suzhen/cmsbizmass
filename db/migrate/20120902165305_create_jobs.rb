class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :name
      t.integer :people
      t.string :place
      t.text :description

      t.timestamps
    end
  end
end
