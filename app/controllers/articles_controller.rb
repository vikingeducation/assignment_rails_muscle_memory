class ArticlesController < ApplicationController

  def new
  end

  def create
    Article.new(title: params[:title], body: params[:body])
  end

end
