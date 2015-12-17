class ArticlesController < ApplicationController

  def show

  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      flash.notice = "Saved successfully!"
      redirect_to @article
    else
      render :new
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
