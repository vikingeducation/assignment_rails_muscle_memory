class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def new
  end

  def create
    @article = Article.new
    @article.title = params[:title]
    @article.body = params[:body]
    @article.save

    redirect_to article_path( @article )
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    redirect_to article_path(@article)
  end

  private

    def article_params
      params.require(:article).permit(:title, :body)
    end
end
