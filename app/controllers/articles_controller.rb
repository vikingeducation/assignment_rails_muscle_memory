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

		@article.save

		redirect_to @article

	end

	def show

		@article = Article.find( params[:id])

	end

	def edit

	end


end
