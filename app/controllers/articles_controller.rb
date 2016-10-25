class ArticlesController < ApplicationController

	include ArticlesHelper

	def index

		@articles = Article.all

	end



	def new

		@article = Article.new

	end


	def create

		@article = Article.new( article_params )

		if @article.save

			redirect_to @article
		else
			render 'new'
		end

	end

	def show

		@article = Article.find( params[:id])

	end

	def edit

		@article = Article.find(params[:id])

	end

	def update

		@article = Article.find( params[ :id ] )
		@article.update( article_params )

		redirect_to action: 'index'

	end

	def destroy

		@article = Article.find( params[ :id ] )

		@article.destroy

		redirect_to action: 'index'

	end


end
