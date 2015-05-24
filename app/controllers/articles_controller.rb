class ArticlesController < ApplicationController
	def index
		@articles = Article.all
	end

	def show
		@article = Article.find(params[:id])
	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.new
		@article.title = params[:article][:title]
		@article.body = params[:article][:body]
		if @article.save
			redirect_to article_path(@article)
		else
			redirect :new
		end
	end
end
