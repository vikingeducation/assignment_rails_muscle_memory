class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params[:title, :body])
    @article.save
    if @article.save
      redirect_to @article.id
    else
      render :new
    end
  end
end
