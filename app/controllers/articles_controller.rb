class ArticlesController < ApplicationController

  def new
    @article = Article.new
  end

  def destroy
    Article.find_by(id: params[:id]).destroy
    flash[:success] = "Article deleted!"
    redirect_to articles_url
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:success] = "Article created!"
      redirect_to @article
    else
      flash[:error] = "Try that one more time"
      render :new
    end
  end

  def show
    @article = Article.find_by(id: params[:id])
  end

  def index
    @articles = Article.all
  end

  def edit
    @article = Article.find_by(id: params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update_attributes(article_params)
      flash[:success] = "Article updated!"
      redirect_to @article
    else
      flash[:error] = "Try that one more time"
      render :edit
    end
  end

  private
    def article_params
      params.require(:article).permit(:title, :body)
    end

end
