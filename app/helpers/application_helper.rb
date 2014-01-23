module ApplicationHelper
  def blog_title(article=nil)
    if article.present?
      "#{article.title} | #{blog_name}"
    else
      blog_name
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

  def blog_name
    'pe::log'
  end
end
