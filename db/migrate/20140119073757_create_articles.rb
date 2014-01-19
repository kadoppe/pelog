class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :body
      t.integer :published_year
      t.integer :published_month
    end
    add_index :articles, [:published_year, :published_month, :title], unique: true
  end
end
