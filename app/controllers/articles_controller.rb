class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end
  def create
    @article = Article.new(article_params)
    @article.save
    redirect_to @article
  end
  def show
    @article = Article.find(params[:id])
  end

  def article_params
    params.permit(:title, :body)
  end
end
