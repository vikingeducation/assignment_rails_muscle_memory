class ArticlesController < ApplicationController

  def new
  end

  def create
    @article = Article.new(whitelisted_article_params)
    if @article.save
      flash[:success]="article created!"
      redirect_to article_path(@article.id)
    else
      render :new
    end
  end

  def show
    @article = Article.find(params[:id])

  end

  def index
    @articles = Article.all
  end

  private

  def whitelisted_article_params
    params.require(:article).permit(:title, :body)
  end
end
