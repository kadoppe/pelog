class Article < ActiveRecord::Base
  GITHUB_ARTICLES_URL = 'https://github.com/kadoppe/pelog/tree/master/app/articles/'

  default_scope { order('published_at DESC') }

  # return article url on github repository
  def github_url
    GITHUB_ARTICLES_URL + file_name
  end
end
