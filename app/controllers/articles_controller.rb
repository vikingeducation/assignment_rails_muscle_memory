class ArticlesController < ApplicationController

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(strong_params)
    @article.save
  end

  private

    def strong_params
      params.permit(:title, :body)
    end

end
