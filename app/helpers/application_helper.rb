module ApplicationHelper
  def blog_title(article=nil)
    blog_title = 'pelog'
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
end
