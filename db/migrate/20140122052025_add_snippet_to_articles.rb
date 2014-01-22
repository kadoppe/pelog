class AddSnippetToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :snippet, :string
  end
end
