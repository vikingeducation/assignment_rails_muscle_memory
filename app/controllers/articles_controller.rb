class ArticlesController < ApplicationController

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:success] = "Article created."
      redirect_to @article
    else
      flash.now[:error] = "You must include a title and body."
      render 'new'
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

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:success] = "Article updated."
      redirect_to @article
    else
      flash.now[:error] = "Could not update article."
      render 'edit'
    end
  end

  private
    def article_params
      params.require(:article).permit(:title, :body)
    end
end
