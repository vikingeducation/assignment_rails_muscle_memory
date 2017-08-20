class ArticlesController < ApplicationController

  def new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def show
    set_article
  end

  def index
    @articles = Article.all
  end

  def edit
    set_article
  end

  def update
    set_article
    if @article.update(article_params)
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def destroy
    set_article
    @article.destroy
    redirect_to articles_path(@article)
  end

private

def article_params
  params.require(:article).permit(:title, :body)
end

def set_article
  @article = Article.find(params[:id])
end

end
