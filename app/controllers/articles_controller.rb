class ArticlesController < ApplicationController
  include ArticlesHelper
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:success] = "Success Article Created."
      redirect_to article_path(@article)
    else
      flash[:error] = "Error with article."
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end
end
