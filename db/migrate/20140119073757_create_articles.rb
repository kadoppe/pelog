class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles, id: false do |t|
      t.string :file_name, null: false
      t.string :title
      t.string :body
    end
    add_index :articles, :file_name, unique: true
  end
end
