class AddFormattedhtmlToResume < ActiveRecord::Migration
  def change
    add_column :resumes, :formatted_html, :text

  end
end
