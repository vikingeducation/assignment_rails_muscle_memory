class ArticlesController < ApplicationController
  before_action :set_article, :except => [:index, :new, :create]

  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:success] = 'Article created'
      redirect_to @article
    else
      flash.now[:error] = 'Article not created: ' +
        @article.errors.full_messages.join(', ')
      render :new
    end
  end


  def update
    if @article.update(article_params)
      flash[:success] = 'Article updated'
      redirect_to @article
    else
      flash.now[:error] = 'Article not updated: ' +
        @article.errors.full_messages.join(', ')
        render :edit
    end
  end


  def destroy
    if @article.destroy
      flash[:success] = 'Article destroyed'
    else
      flash[:error] = 'Article not destroyed: ' +
        @article.errors.full_messages.join(', ')
    end
    redirect_to articles_path
  end



  private
  def set_article
    @article = Article.find_by_id(params[:id])
    unless @article
      flash[:error] = 'Article not found'
      redirect_back(fallback_location: root_path)
    end
  end

  def article_params
    params.require(:article).permit(
      :title,
      :body
    )
  end
end



