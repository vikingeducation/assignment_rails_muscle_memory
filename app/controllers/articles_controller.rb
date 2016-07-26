class ArticlesController < ApplicationController

  def new
    @article = Article.new
  end

  def show
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      flash[:success] = "Article created!"
      redirect_to article_path(@article)
    else
      flash[:error] = "Could not create article"
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      flash[:success] = "Article updated!"
      redirect_to article_path(@article)
    else
      flash[:error] = "Could not edit article"
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    if @article.destroy
      flash[:success] = "Article deleted!"
    else
      flash[:error] = "Could not delete article"
    end
    redirect_to articles_path
  end


  private

  def article_params
    params.require(:article).permit(:title, :body)
  end

end
