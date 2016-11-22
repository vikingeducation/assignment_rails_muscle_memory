class ArticlesController < ApplicationController

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(strong_params)
    if @article.save
      redirect_to @article
    else
      false
    end
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

  private

    def strong_params
      params.permit(:title, :body)
    end

end
