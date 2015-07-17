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

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    #@article.title, @article.body = @article(whitelisted_article_params)
    if @article.update(whitelisted_article_params)
    # @article.save
      redirect_to article_path(@article.id) # @article
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  private

  def whitelisted_article_params
    params.require(:article).permit(:title, :body)
  end
end
