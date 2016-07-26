class ArticlesController < ApplicationController

  def new

  end

  def create
    @article = Article.new(whitelisted_article_params)
    if @article.save 
      redirect_to articles_path(@article)
    else
      render :new
    end
  end

  private 

  def whitelisted_article_params
    params.require(:article).permit(:title, :body, :id)
  end

  def show
    @article = Article.find(params[:id])
  end

end
