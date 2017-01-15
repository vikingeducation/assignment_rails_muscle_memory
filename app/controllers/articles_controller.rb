class ArticlesController < ApplicationController

	def new
		@article = Article.new
	end

	def index
		@articles = Article.all
	end

	def create
		@article = Article.new(article_params)
		@article.title = params[:title]
		@article.body = params[:body]
		if @article.save
			flash[:success] = "Great! Your article has been created!"
			redirect_to article_path(@article.id)
		else
			flash[:error] = "Could not save!"
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
			flash[:success] = "Great! Your article has been updated!"
			redirect_to article_path(@article.id)
		else
			flash[:error] = "Could not update!"
		end
	end

	def article_params
    	params.permit(:title, :body)
  	end

  	def destroy
		@article = Article.find(params[:id])
		if @article.destroy
			flash[:success] = "Great! Your article has been removed!"
			redirect_to articles_path
		else
			flash[:error] = "Could not remove!"
		end
  	end

end
