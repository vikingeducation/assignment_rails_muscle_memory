class ArticlesController < ApplicationController

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(post_params)
    if @article.save
      redirect_to @article
    else
      false
    end
  end

  def show

  end

  def post_params
    params.require(:article).permit(:title, :body)
  end

end
