class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def edit
    @article = Article.find(params[:id])
  end

  def new
  end

  def create
    new_article = Article.new({:title => params[:title], :body => params[:body]})
    if new_article.save
      true
      redirect_to article_path(new_article.id)
    else
      false
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update({:title => params[:title], :body => params[:body]})
      true
      redirect_to article_path(@article.id)
    else
      false
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end
end
