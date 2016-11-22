class ArticlesController < ApplicationController
  before_action :find_article, only: [:show, :edit, :update, :destroy]

  def create
    @article = Article.new(allowed_params)
    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  def destroy
    @article.destroy
    redirect_to root_path
  end

  def edit

  end

  def index
    @articles = Article.all
  end

  def new
  end

  def update
    if @article.update(allowed_params)
      redirect_to @article
    else
      render :edit
    end
  end

  def show
  end

  private
    def find_article
      @article = Article.find(params[:id])
    end

    def allowed_params
      params.require(:article).permit(:title, :body)
    end
end
