class ArticlesController < ApplicationController
  def new
  end

  def create
    @article = Article.new(title: params[:title], body: params[:body])
    if @article.save
      redirect_to article_path(@article.id)
    else

    end
  end
end
