class ArticlesController < ApplicationController

  def new
    @article = Article.new
  end

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
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

  def update
    @article = Article.find(params[:id])
    if @article.update(whitelisted_params)
      redirect_to article_path(@article.id)
    else
      redirect_to edit_article_path(@article.id)
    end
  end

  def destroy
    @article = Article.find(params[:id])
    if @article.destroy
      redirect_to articles_path
    else
      redirect_to article_path(@article.id)
    end
  end

  private

  def whitelisted_params
    params.require(:article).permit(:title, :body)
  end
end
