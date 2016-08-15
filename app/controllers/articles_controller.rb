class ArticlesController < ApplicationController
  def new
  end

  def create
    new_article = Article.new({:title => params[:title], :body => params[:body]})
    if new_article.save
      true
      redirect_to article_path(new_article.id)
    else
      false
    end
  end

  def show
    @article = Article.find(params[:id])
  end
end
