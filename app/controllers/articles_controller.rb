class ArticlesController < ApplicationController

  def new
    @article = Article.new
  end

  def index
  end

  def update
  end

  def show
  end

  def destroy
  end

  def edit
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  private

  def article_params
    params.require(:article).permit(:title,:body)
  end


end
