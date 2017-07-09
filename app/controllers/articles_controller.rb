class ArticlesController < ApplicationController

  include ArticlesHelper

  def new
    @article = Article.new
  end

  def index
    @articles = Article.all
  end

  def create
    @article = Article.new(whitelisted_post_params)
    if @article.save
      flash.notice = "Article '#{@article.title}' created!"
      redirect_to article_path(@article)
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
    if @article.update(whitelisted_post_params)
      flash.notice = "Article '#{@article.title}' Updated!"
      redirect_to article_path(@article)
    else
      flash.notice = "Article '#{@article.title}' Not updated!"
      render :show
    end
  end

  def destroy
    @article = Article.find(params[:id])
    if @article.destroy
      flash.notice = "Article '#{@article.title}' Deleted!"
      redirect_to articles_path
    else
      flash.notice = "Article '#{@article.title}' Not deleted!"
      render :index
    end
  end


end
