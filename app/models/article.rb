class Article < ActiveRecord::Base
  FILE_PATH_PATTERN = "#{Rails.root}/app/articles/*.md"

  # Sync database record with markdown files
  def self.sync
    before_ids = Article.all.pluck(:id)
    after_ids = []

    file_paths.each do |file_path|
      article_data = extract_meta_data(file_path)
      article = Article.where(article_data).first_or_create

      article.body = extract_body(file_path)
      article.save!

      after_ids << article.id
    end

    will_delete_ids = before_ids - after_ids
    Article.where(id: will_delete_ids).destroy_all
  end

  # Get all markdown file paths
  def self.file_paths
    Dir.glob(FILE_PATH_PATTERN).sort
  end

  # Extract meta data of article
  #
  # @param file_path [String] markdown file path
  # @return [Hash] meta data of article
  def self.extract_meta_data(file_path)
    m = /(\d{4})-(\d{2})-(\d{2})-(.+)\.md/.match(file_path)
    {
      published_year: m[1].to_i,
      published_month: m[2].to_i,
      published_date: m[3].to_i,
      slug: m[4]
    }
  end

  # Extract html body of article
  #
  # @param file_path [String] markdown file path
  # @return [String] html body of article
  def self.extract_body(file_path)
    text = File.open(file_path).read
    Kramdown::Document.new(text, auto_ids: false).to_html
  end
end
