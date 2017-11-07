class ArticlesController < ApplicationController

  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Article has been created!"
      redirect_to @article
    else
      flash.now[:alert] = "Whoopsie!"
      render :new
    end
  end

  def update
    if @article.update(article_params)
      flash.notice = "Success!"
      redirect_to @article
    else
      flash.now.alert = "Whoopsiedupskies..."
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
