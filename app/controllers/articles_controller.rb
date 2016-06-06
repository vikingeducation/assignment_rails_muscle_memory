class ArticlesController < ApplicationController

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(title: params[:title], body: params[:body])
    @article.save
    redirect_to article_path(@article)
  end

  def show
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(title: params[:title], body: params[:body])
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

end
