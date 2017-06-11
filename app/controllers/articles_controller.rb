class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(whitelisted_article_params)

    if @article.save
      redirect_to article_path(@article)
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(whitelisted_article_params)
      redirect_to article_path(@article)
    end
  end

  def destroy
    @article = Article.find(params[:id])

    if @article.destroy
      redirect_to articles_path
    end
  end

  private

  def whitelisted_article_params
    params.permit(:title, :body)
  end
end
