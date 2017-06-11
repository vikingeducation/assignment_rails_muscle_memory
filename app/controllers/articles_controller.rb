class ArticlesController < ApplicationController

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(whitelisted_article_params)

    if @article.save
      redirect_to article_path(@article)
    else

    end
  end

  def show
    @article = Article.find(params[:id])
  end

  private

  def whitelisted_article_params
    params.permit(:title, :body)
  end
end
