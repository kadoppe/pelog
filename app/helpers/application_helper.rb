module ApplicationHelper
  def article_permalink article
    published_at = article.published_at
    article_path(
      year: published_at.strftime('%Y'),
      month: published_at.strftime('%m'),
      day: published_at.strftime('%d'),
      slug: article.slug,
      format: :html
    )
  end
end
