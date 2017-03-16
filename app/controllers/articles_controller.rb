class ArticlesController < ApplicationController


  def index
    @articles = Article.all
  end

  def new 

  end

  def create
    @article = Article.new(article_params)
    if @article.save
#     redirect_to @article  ... this is a short cut
      redirect_to article_path(@article.id)
    else
      render :new    # implicit so therefore don't really need?
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update

    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to articles_path
    else
      render :show
    end

    # Article.update(article_params)
    # if @article.save
    #   redirect_to article_path(@article.id)
    # else
    #   render :new
    # end

  end

# when doing form, remember change the action (update not create)

 def destroy
    @article = Article.find(params[:id])
    @article.destroy
    # flash.notice = "Article '#{@article.title}' Deleted!"
    redirect_to articles_path
  end


#

  private
    def article_params
      params.require(:article).permit(:title, :body)
    end


end
