class ArticlesController < ApplicationController

  def new
    @article = Article.new
  end

  def show
    @article = Article.find(params[:id])
  end

  def create

    @article = Article.new(whitelisted_params)
    if @article.save
      redirect_to articles_path(@article.id)
    else
      redirect_to new_articles_path
    end
  end

  def whitelisted_params
    params.require(:article).permit(:title, :body)
  end
end
