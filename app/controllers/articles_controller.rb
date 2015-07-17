class ArticlesController < ApplicationController

  include ArticlesHelper

  def new

  end

  def index
    @articles = Article.all
  end

  def create
    @article = Article.new(allowed_params)
    @article.save
    redirect_to article_path(@article.id)
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(allowed_params)
    redirect_to article_path(@article.id)
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy
    flash[:success] = "Post was successfully deleted!"
    redirect_to root_path
  end

end
