class ArticlesController < ApplicationController


  def index
    @articles = Article.all
  end

  def new 

  end

  def create
    @article = Article.new(:title => "title", :body => "body")
      # Could one have instead: 
      # @article = Article.new params[:title, :body] OR
      # @article = Article.new(article_params) with private method   (see below) ?

    if @article.save
#     redirect_to @article  ... this is a short cut
      redirect_to article_path(@article.id)
    else
      render :new    # implicit so therefore don't really need?
    end
  end

  def show
    @article = Article.find(:id)
  end

end
