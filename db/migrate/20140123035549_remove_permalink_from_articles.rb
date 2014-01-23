class RemovePermalinkFromArticles < ActiveRecord::Migration
  def change
    remove_column :articles, :permalink, :string
  end
end
