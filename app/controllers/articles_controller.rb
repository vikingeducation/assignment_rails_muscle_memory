class ArticlesController < ApplicationController

  def new
  end

  def create
    @article = Article.new(title: params[:title], body: params[:body])
    if @article.save
      redirect_to article_path(@article.id)
    else
      render :new
    end
  end

  def show
    @article = Article.find( params[:id] )
  end

end

#
# if @post.save
#      ... code to set up congratulations message ...
#      redirect_to post_path(@post.id) # go to show page for @post
#    else
#      ... code to set up error message ...
#      render :new
#    end
