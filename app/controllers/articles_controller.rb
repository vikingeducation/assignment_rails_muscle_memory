class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end
  
  def create
    article = Article.new(good_params)
    if article.save
      flash[:success] = "Your article has been created!"
      redirect_to @post
    else
      flash.now[:error] = "Fix your error!"
      render :new
    end
  end

  def index
  end
  def edit
  end
  def show
  end
  def good_params
    params.require(:post).permit(:title, :body
  end
end
