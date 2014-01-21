class AddFileNameToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :file_name, :string
  end
end
