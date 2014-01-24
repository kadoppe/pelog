# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://blog.kadoppe.com"

SitemapGenerator::Sitemap.create do
   Article.find_each do |article|
      published_at = article.published_at
      options = {
        year: published_at.strftime('%Y'),
        month: published_at.strftime('%m'),
        day: published_at.strftime('%d'),
        slug: article.slug,
        format: :html
      }
      add article_path(options), lastmod: article.published_at
   end
end
