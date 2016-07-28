class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(good_params)
    if @article.save
      flash[:success] = "Your article has been created!"
      redirect_to @article
    else
      flash.now[:error] = "Fix your error!"
      render :new
    end
  end

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def good_params
    params.permit(:title, :body)
  end
end
