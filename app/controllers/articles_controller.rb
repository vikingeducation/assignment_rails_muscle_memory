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
    @article = Article.find(params[:id])
  end

  def index 
    @articles = Article.all

  end

  def edit
    @article = Article.find(params[:id])

    #redirect_to article_path(@article)
  end

  def update
    @article = Article.find(params[:id])
    if @article.update({:body => params[:body], 
                                  :title => params[:title] })
      flash[:success]
      redirect_to article_path(@article)
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
     redirect_to root_path
  end

private
  def article_params
    params.require(:article).permit(:title, :body)
  end


end
