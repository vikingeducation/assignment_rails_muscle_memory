class ArticlesController < ApplicationController

  def new
  end

  def create
    @article = Article.new({title: params[:title], body: params[:body]})
    redirect_to article_path(@article) if @article.save
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
    redirect_to article_path(@article) if @article.update({title: params[:title], body: params[:body]})
  end

  def destroy
    @article = Article.find(params[:id])
    redirect_to articles_path if @article.destroy
  end
end
