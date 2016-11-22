class ArticlesController < ApplicationController

  def create
    @article = Article.new(allowed_params)
    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  def new
  end

  def show
    @article = Article.find(params[:id])
  end

  private
    def allowed_params
      params.require(:article).permit(:title, :body)
    end
end
