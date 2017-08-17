class ArticlesController < ApplicationController

  include ArticlesHelper

  def new
  end

  def create
    @article = Article.new(:title => params[:title], :body => params[:body])
    if @article.save
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

end
