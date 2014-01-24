class RemoveConstrainsFromArticles < ActiveRecord::Migration
  def change
    remove_index :articles, name: "index_articles_on_published_year_and_published_month_and_slug"
    add_index :articles, [:published_at, :slug]
  end
end
