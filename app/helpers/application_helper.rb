module ApplicationHelper
  def blog_title(article=nil)
    blog_title = 'pe::log'
    if article.present?
      "#{article.title} | #{blog_title}"
    else
      blog_title
    end
  end

  def blog_description(article=nil)
    if article.present?
      article.snippet
    else
      'A blog written by kadoppe.'
    end
  end

  def blog_author
    'kadoppe'
  end

  def canonical_url(article=nil)
    if article.present?
      article_permalink(article, true)
    else
      root_url
    end
  end
end
