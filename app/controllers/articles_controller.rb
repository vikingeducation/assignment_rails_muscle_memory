class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(safe_params)
    if @article.save
      redirect_to article_path(@article.id)
    else
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(safe_params)
      redirect_to article_path(@article.id)
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    if @article.destroy
      redirect_to articles_path
    else
      render :edit
    end
  end

  private
  def safe_params
    params.require(:article).permit(:title, :body)
  end

end
