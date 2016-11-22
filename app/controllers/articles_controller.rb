class ArticlesController < ApplicationController

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article
    else
      flash.now[:error] = "You must include a title and body."
      render :new
    end
  end

  private
    def article_params
      params.require(:article).permit(:title, :body)
    end
end
