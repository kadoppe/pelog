class Article < ActiveRecord::Base
  FILE_PATH_PATTERN = "#{Rails.root}/app/articles/*.md"

  default_scope order('published_at DESC')

  # Sync database record with markdown files
  def self.sync
    before_ids = Article.all.pluck(:id)
    after_ids = []

    file_paths.each do |file_path|
      article_data = extract_meta_data(file_path)
      article = Article.where(article_data).first_or_create

      article.body = extract_body(file_path)

      front_matter = extract_front_matter(file_path)
      if front_matter.present?
        article.title = front_matter[:title]
        article.permalink = front_matter[:permalink]
      end

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
      published_at: Date.new(m[1].to_i, m[2].to_i, m[3].to_i),
      slug: m[4]
    }
  end

  # Extract html body of article
  #
  # @param file_path [String] markdown file path
  # @return [String] html body of article
  def self.extract_body(file_path)
    text = File.open(file_path).read
    text.gsub!(/---\n(.*)---\n/m, '')
    Kramdown::Document.new(text, auto_ids: false).to_html
  end

  # Extract front matter of article
  #
  # @param file_path [String] markdown file path
  # @return [Hash] yaml tree of front matter
  def self.extract_front_matter(file_path)
    text = File.open(file_path).read
    m = /---\n(.*)---\n/m.match(text)
    if m.present?
      front_matter = YAML::parse(m[1]).transform.symbolize_keys

      if front_matter[:permalink].present?
        front_matter[:permalink].gsub!(/^\//, '')
      end

      return front_matter
    end
  end
end
