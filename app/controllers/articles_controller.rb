class ArticlesController < ApplicationController

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(strong_params)
    if @article.save
      redirect_to show_path

    else
      false
    end
  end

  def show
    @article = Article.find(:id)
  end

  private

    def strong_params
      params.permit(:title, :body)
    end

end
