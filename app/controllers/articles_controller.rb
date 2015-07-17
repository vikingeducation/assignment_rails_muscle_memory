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

end
