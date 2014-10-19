class ArticlesController < ApplicationController

  def index
    @articles = Article.all

    Keen.publish(:show_index, {})
  end

  def show
    @article = Article.find_by!(
      published_at: date_from_params,
      slug: params[:slug]
    )

    Keen.publish(:show_article, {
      title: @article.title,
    })
  end

  def feed
    @articles = Article.all
    render :feed, formats: :xml
  end

  private

  def date_from_params
    Date::new(params[:year].to_i, params[:month].to_i, params[:day].to_i)
  end
end
