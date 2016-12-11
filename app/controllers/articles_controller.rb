class ArticlesController < ApplicationController
  include ArticlesHelper
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      #flash[:success] = "Success Article Created."
      #flash.notice
      redirect_to article_path(@article), notice: "Sucess"
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

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:success] = "Success Article Update"
      redirect_to article_path(@article)
    else
      flash[:error] = "Error with Update."
    end
  end

  def destroy
    @article = Article.find(params[:id])
    if @article.destroy
      flash[:success] = "Success Article Deleted"
    else
    end

    redirect_to articles_path
  end
end
