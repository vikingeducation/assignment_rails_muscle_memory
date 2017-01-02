class ArticlesController < ApplicationController
  
  def index
    @articles = Article.all
  end

  def new
  end

  def create
    @article = Article.new(article_params)
    @article.save
    flash.notice = "Saved!"
    redirect_to article_path(@article)
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash.notice = "Updated!"
      redirect_to @article
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    if @article.destroy
      flash.notice = "Deleted!"
      redirect_to root_path
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end

end
