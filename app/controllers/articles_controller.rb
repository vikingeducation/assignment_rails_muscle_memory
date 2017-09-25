class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :show, :update, :destroy]
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      flash.notice = "Article created successfully"
      redirect_to @article
    else
      render :new
    end
  end

  def update
    if @article.update(article_params)
      flash.notice = "updated successfully"
      redirect_to @article
    else
      render :edit
    end
  end

  def destroy
    if @article.destroy
      flash.notice = "Article was deleted."
      redirect_to articles_path
    else
      flash.now[:notice] = 'something went wrong.'
      render :show
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
