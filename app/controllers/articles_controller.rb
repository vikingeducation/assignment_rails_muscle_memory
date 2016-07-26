class ArticlesController < ApplicationController

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      flash[:success] = "Article created!"
      redirect_to article_path(@article)
    else
      flash[:error] = "Could not create article"
      render :new
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end

end
