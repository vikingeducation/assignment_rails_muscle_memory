class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  # def show
    # @article = Article
  # end

  def create
    @article = Article.new(whitelisted_article_params)
    if @article.save
      redirect_to article_path(@article[:id])
      flash[:success] = "Article saved."
    else
      flash[:error] = "Article was not saved."
      render :new
    end
  end

  def whitelisted_article_params
    params.require(:article).permit(:title,:body)
  end
end
