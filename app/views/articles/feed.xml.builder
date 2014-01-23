atom_feed(language: 'ja-JP') do |feed|
  feed.title blog_title
  feed.subtitle blog_description
  feed.updated Time.now
  feed.author { |author| author.name(blog_author) }

  @articles.each do |article|
    feed.entry(article,
               url: article_permalink(article, true),
               id: article_permalink(article, true),
               published: article.published_at.to_datetime,
               updated: article.published_at.to_datetime
              ) do |item|
      item.title(article.title)
      item.content(article.snippet, type: 'html')
      item.author { |author| author.name(blog_author) }
    end
  end
end
