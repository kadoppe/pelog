class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :slug
      t.string :body
      t.integer :published_year
      t.integer :published_month
      t.integer :published_date
    end
    add_index :articles, [:published_year, :published_month, :slug], unique: true
  end
end
