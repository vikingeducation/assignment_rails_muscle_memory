class ArticlesController < ApplicationController

  before_action :set_article, only: [:show]

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Article has been created!"
      redirect_to @article
    else
      flash.now[:alert] = "Whoopsie!"
      render :new
    end

  end

  def index
    @articles = Article.all
  end

  def show
  end

  # def edit
  # end

  # def update
  # end

  # def destroy
  # end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
