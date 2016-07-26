class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(whitelisted_article_params)
    if @article.save
      redirect_to article_path(@article.id)
    else
      render :new
    end

  end

  def show
    @article = Article.find(params[:id])
  end

  def index
    Article.all
  end

  def edit
    @article = Article.find(params[:id])

  end

  def update
    @article = Article.find(params[:id])

    if @article.update(whitelisted_article_params)
      redirect_to article_path(@article.id)
    else
      render :edit
    end

  end

  def destroy
    if Article.find(params[:id]).destroy
      redirect_to articles_path
    else
      flash[:error] = "Could not delete that post!"
      render :show
    end

  end

  private

  def whitelisted_article_params
    params.require(:article).permit(:title, :body)
  end

end
