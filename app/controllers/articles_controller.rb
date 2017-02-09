class ArticlesController < ApplicationController

  def new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:success] = 'Success! Article created'
      redirect_to article_path(@article)
    else
      flash.now[:error] = 'Article not created: ' +
        @article.errors.full_messages.join(', ')
      render :edit
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
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:success] = 'Success! Article updated'
      redirect_to article_path(@article)
    else
      flash.now[:error] = 'Article not updated: ' + @article.error.full_messages.join(', ')
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    if @article.destroy
      flash[:success] = 'Success! Article deleted'
      redirect_to articles_path
    else
      flash.now[:error] = 'Article not deleted: ' + @article.error.full_messages.join(', ')
      render :show
    end
  end

  def article_params
    params.require(:article).permit(
      :title,
      :body
    )
  end
end
