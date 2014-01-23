class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find_by(
      published_at: date_from_params,
      slug: params[:slug]
    )
  end

  private

  def date_from_params
    Date::new(params[:year].to_i, params[:month].to_i, params[:day].to_i)
  end
end
