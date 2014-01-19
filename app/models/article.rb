class Article < ActiveRecord::Base
  FILE_PATH_PATTERN = "#{Rails.root}/app/articles/*.md"

  def self.sync
    self.file_paths.each do |file_path|
      article_data = self.parse_file_path(file_path)
      Article.where(article_data).first_or_create
    end
  end

  def self.file_paths
    Dir.glob(FILE_PATH_PATTERN).sort
  end

  def self.parse_file_path(file_path)
    m = /(\d{4})-(\d{2})-(\d{2})-(.+)\.md/.match(file_path)
    {
      published_year: m[1].to_i,
      published_month: m[2].to_i,
      published_date: m[3].to_i,
      slug: m[4]
    }
  end
end
