class ArticlesController < ApplicationController
  def new
  end

  def show
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(title: params[:title], body: params[:body])
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def index
    @articles = Article.all
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.update(title: params[:title], body: params[:body])
    if @article.save
      redirect_to @article
    else
      render 'edit'
    end
  end

end
