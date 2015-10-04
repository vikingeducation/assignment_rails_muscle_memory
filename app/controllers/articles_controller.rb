class ArticlesController < ApplicationController

  
  def show
    @article = Article.find(params[:id])
  end


  def index
    @articles = Article.all
  end


  def new
    
  end


  def create
    @article = Article.new(whitelisted_params)
    if @article.save
      redirect_to article_path(@article)
    else
      render :new
    end
  end


  def edit
    @article = Article.find(params[:id])
  end


  def update
    @article = Article.find(params[:id])
    if @article.update(whitelisted_params)
      redirect_to article_path(@article)
    else
      render :edit
    end
  end


  private

  def whitelisted_params
    params.require(:article).permit(:title, :body)
  end

end
