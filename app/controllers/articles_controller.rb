class ArticlesController < ApplicationController

  include ArticlesHelper

  def new
  end

  def create
    @article = Article.new(whitelisted_post_params)
    if @article.save
      redirect_to article_path(@article)
    else
      render :new
    end
  end

  # def index
  #   @article = Article.all
  # end

  

end
