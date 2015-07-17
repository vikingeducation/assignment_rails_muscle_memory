class ArticlesController < ApplicationController
  def new
  end

  def index
    @articles = Article.all
  end

  def create
    @new_article = Article.new
    @new_article.title = params[:title]
    @new_article.body = params[:body]
    if @new_article.save
      redirect_to(article_path(@new_article))
    else
      render :new
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
    if @article.update(title: params[:title], body: params[:body])
      redirect_to article_path(@article)
    else
      redirect_to edit_article_path(@article)
    end
  end

  def destroy
    @article = Article.find(params[:id])
    if @article.destroy
      redirect_to articles_path
    else
      redirect_to article_path(@article)
    end
  end

end
