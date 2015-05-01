class ArticlesController < ApplicationController
  include ArticlesHelper
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:success] = "Article '#{@article.title}' created!"
      redirect_to @article
    else
      flash.now[:error] = "Problem creating the article!"
      render :index
    end
  end

  def show
    @article = Article.find(params[:id])
  end
end
