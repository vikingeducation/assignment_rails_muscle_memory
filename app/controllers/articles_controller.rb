class ArticlesController < ApplicationController

  def new
  end

  def create
    @article = Article.new(article_params)
    @article.save
    redirect_to article_path(@article.id)
  end

  def show
    @article = Article.find_by_id( params[:id] ) #returns nill if nothing there
  end

  def index
    @articles = Article.all
  end

  def edit
    @article = Article.find_by_id(params[:id])
  end

  def update
    @article = Article.find_by_id(params[:id])
    @article.update(article_params)
    redirect_to article_path(@article.id)

  end

  def destroy
    @article = Article.find_by_id(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  private

    def article_params
      params.require(:article).permit(:title, :body)
    end

end
