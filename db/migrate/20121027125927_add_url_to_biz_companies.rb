class AddUrlToBizCompanies < ActiveRecord::Migration
  def change
    add_column :biz_companies, :url, :string

  end
end
