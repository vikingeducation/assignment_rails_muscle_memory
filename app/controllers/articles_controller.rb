class ArticlesController < ApplicationController

  def new

  end

  def create
    @article = Article.new(whitelisted_post_params)
    if @article.save
      redirect_to :show
    end
  end


  private

  def whitelisted_post_params
    params.require(:article).permit(:title, :body)
  end

end
