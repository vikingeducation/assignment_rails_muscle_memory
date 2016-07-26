class ArticlesController < ApplicationController

  def new
    
  end

  def create
    @article = Article.new({:body => params[:body], 
                                         :title   => params[:title] })
    @article.save
    flash[:success]

    redirect_to '/new'
  end

  def show

  end
end
