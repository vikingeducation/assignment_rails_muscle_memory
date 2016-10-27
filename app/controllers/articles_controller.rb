class ArticlesController < ApplicationController
  include ArticlesHelper
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to article_path(@article)
    else
    end
  end
end
