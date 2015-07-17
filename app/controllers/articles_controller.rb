class ArticlesController < ApplicationController

  def new
  end

  def create
    @article = Article.new(whitelisted_article_params)
    @article.save
    redirect_to root_path
  end

  private

  def whitelisted_article_params
    params.require(:article).permit(:title, :body)
  end
end
