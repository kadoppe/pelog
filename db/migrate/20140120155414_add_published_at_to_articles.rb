class AddPublishedAtToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :published_at, :date
    remove_column :articles, :published_year
    remove_column :articles, :published_month
    remove_column :articles, :published_date
    add_index :articles, :published_at
  end
end
