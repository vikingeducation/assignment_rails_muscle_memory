class ArticlesController < ApplicationController

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(title: params[:title], body: params[:body])
    @article.save
    redirect_to article_path(@article)
  end

  def show
    @article = Article.find(params[:id])
  end

end
