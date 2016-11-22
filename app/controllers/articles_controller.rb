class ArticlesController < ApplicationController

  def new
  end

  def create
    @article = Article.new(allowed_params)
    @article.save
    redirect_to new_article_path
  end

  private
    def allowed_params
      params.require(:article).permit(:title, :body)
    end
end
