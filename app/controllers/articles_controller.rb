class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find_by(permalink: permalink_with_format)
  end

  private

  # Return permalink with format extension
  def permalink_with_format
    if params[:format].present?
      return "#{params[:permalink]}.#{params[:format]}"
    else
      return params[:permalink]
    end
  end
end
