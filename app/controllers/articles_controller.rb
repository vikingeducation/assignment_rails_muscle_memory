class ArticlesController < ApplicationController

  def new
    
  end

  def create
    @article = Article.new({:body => params[:body], 
                                         :title   => params[:title] })
    if @article.save
      flash[:success]
      redirect_to article_path(@article)
    end
  end

  def show
    @article =Article.find(params[:id])

  end
end
