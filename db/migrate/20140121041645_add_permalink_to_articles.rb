class AddPermalinkToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :permalink, :string
    add_index :articles, :permalink, unique: true
  end
end
