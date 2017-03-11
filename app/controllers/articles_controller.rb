class ArticlesController < ApplicationController

  def index
    @article = Article.all
  end


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
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(post_params)
      redirect_to @article
    else
      render :edit
    end
  end

  def post_params
    params.require(:article).permit(:title, :body)
  end

end
