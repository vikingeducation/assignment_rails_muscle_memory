class ArticlesController < ApplicationController
include ArticleHelper

  def index
     @articles=Article.all

  end

  def new
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end
  
  def update
    @article = Article.find(params[:id])
    @article.update(article_params)

    if @article.save
      redirect_to article_path(@article)
    else
      false
    end
  end

  def edit
    @article = Article.find(params[:id])

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
