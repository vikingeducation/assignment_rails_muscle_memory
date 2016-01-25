class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def new
  end

  def create
    @article = Article.new(whitelisted_article_params)
    if @article.save
      redirect_to article_path(@article.id)
    else

    end
  end

  def show
    @article = Article.find( params[:id] )
  end

  def edit
    @article = Article.find( params[:id] )
  end

  private

  def whitelisted_article_params
    params.require(:article).permit(:title, :body)
  end
end
