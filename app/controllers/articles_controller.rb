class ArticlesController < ApplicationController

  def new
  end

  def create
    @article = Article.new({title: params[:title], body: params[:body]})
    redirect_to article_path(@article) if @article.save
  end
end
