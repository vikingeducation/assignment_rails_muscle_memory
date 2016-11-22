class ArticlesController < ApplicationController
  def new
  end

  def create
    @article = Article.new(title: params[:title], body: params[:body])
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

end
