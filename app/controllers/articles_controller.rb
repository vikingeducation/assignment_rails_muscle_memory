class ArticlesController < ApplicationController

  def create
    @article = Article.new(allowed_params)
    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to root_path
  end

  def edit
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all()
  end

  def new
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(allowed_params)
      redirect_to @article
    else
      render :edit
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  private
    def allowed_params
      params.require(:article).permit(:title, :body)
    end
end
