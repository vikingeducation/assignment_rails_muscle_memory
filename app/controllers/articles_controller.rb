class ArticlesController < ApplicationController

  def new
    @article = Article.new
  end

  def create
    a = Article.new(article_params)
    if a.save
      redirect_to :show
    end

  end

  def article_params
    params.permit(:title, :body)
  end

end
