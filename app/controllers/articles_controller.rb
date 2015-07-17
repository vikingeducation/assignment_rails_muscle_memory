class ArticlesController < ApplicationController
  def new
  end

  def index
    @articles = Article.all
  end

  def create
    @new_article = Article.new
    @new_article.title = params[:title]
    @new_article.body = params[:body]
    if @new_article.save
      redirect_to(article_path(@new_article))
    else
      render :new
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.title = params[:title]
    @article.body = params[:body]
    @article.save
    redirect_to article_path(@article)
  end

end
