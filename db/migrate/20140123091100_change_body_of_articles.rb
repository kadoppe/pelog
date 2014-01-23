class ChangeBodyOfArticles < ActiveRecord::Migration
  def change
    change_column :articles, :body, :text
    change_column :articles, :snippet, :text
  end
end
