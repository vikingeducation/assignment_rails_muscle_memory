class ArticlesController < ApplicationController

	include ArticlesHelper

	def new


	end


	def create

		@article = Article.new( article_params )

		@article.save

		redirect_to @article

	end

	def show

		@article = Article.find( params[:id])

	end


end
