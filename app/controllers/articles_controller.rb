class ArticlesController < ApplicationController

  def new
  end

  def create
    article = Article.new(title: params[:title], body: params[:body])
    article.save
  end

end
