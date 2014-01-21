namespace :articles do
  desc 'Sync db with markdown files'
  task sync: :environment do
    ArticleParser.sync
  end
end
