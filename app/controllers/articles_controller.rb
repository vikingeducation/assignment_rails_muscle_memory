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

end
