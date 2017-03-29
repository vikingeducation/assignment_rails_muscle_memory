class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    a = Article.new(article_params)
    if a.save
      redirect_to a
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def article_params
    params.permit(:title, :body)
  end

end
