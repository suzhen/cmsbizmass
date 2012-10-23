class AddUrlToAd < ActiveRecord::Migration
  def change
    add_column :ads, :url, :string

  end
end
