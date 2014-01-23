module ArticlesHelper
  def article_permalink(article, absolute_path=false)
    published_at = article.published_at
    options = {
      year: published_at.strftime('%Y'),
      month: published_at.strftime('%m'),
      day: published_at.strftime('%d'),
      slug: article.slug,
      format: :html
    }

    absolute_path ? article_url(options) : article_path(options)
  end
end
