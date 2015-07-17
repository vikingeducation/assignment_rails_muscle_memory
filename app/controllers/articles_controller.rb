class ArticlesController < ApplicationController

  def new
  end

  def create
    @article = Article.new(post_params)
    @article.save
    redirect_to root_path
  end

  private

  def post_params
    params.require(:articles).permit(:title, :body)
  end
end
