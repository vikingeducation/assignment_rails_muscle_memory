class ArticlesController < ApplicationController

  def new
    
  end

  def show
    @article = Article.find(params[:id])
  end


  def create
    @article = Article.new(whitelisted_params)
    if @article.save
      redirect_to article_path(@article)
    else
      render :new
    end
  end


  private

  def whitelisted_params
    params.require(:article).permit(:title, :body)
  end

end
