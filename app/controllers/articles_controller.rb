class ArticlesController < ApplicationController
include ArticleHelper
  def index
  end

  def new
  end

  def show
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)

    @article.save

    redirect_to article_path(@article)

  end

end
