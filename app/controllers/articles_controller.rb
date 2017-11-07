class ArticlesController < ApplicationController
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

  # def index
  # end

  # def show
  # end

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
end
