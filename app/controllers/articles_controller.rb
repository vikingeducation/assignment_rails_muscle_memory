class ArticlesController < ApplicationController

  def new

  end

  def index
    @articles = Article.all
  end

  def create
    @article = Article.new(whitelisted_post_params)
    if @article.save
      redirect_to article_path(@article)
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  private

  def whitelisted_post_params
    params.require(:article).permit(:title, :body)
  end

end
