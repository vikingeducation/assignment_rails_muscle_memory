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

	def edit
		@article = Article.find(params[:id])
	end

	def create
		@article = Article.new(article_params)
		if @article.save
			flash[:success] = 'Article created!'
			redirect_to article_path(@article.id)
		else
			flash.now[:error] = 'Error: article not created'
			render :new
		end
	end

	def update
		@article = Article.find(params[:id])
		if @article.update_attributes(article_params)
			flash[:success] = 'Article updated!'
			redirect_to article_path(@article.id)
		else
			flash.now[:error] = 'Error: article not updated'
			render :edit
		end
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy
		flash[:success] = 'Article destroyed!'
		redirect_to articles_path
	end

	def article_params
		params.require(:article).permit(:title, :body)
	end
end
