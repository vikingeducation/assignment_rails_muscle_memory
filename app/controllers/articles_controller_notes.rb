class ArticlesController < ApplicationController

  def new 

  end

  def create
    @article = Article.new(:title => "title", :body => "body")
      # Could one have instead: 
      # @article = Article.new params[:title, :body] OR
      # @article = Article.new(article_params) with private method   (see below) ?

    if @article.save
#     redirect_to @article  ... this is a short cut
      redirect_to article_path(@article.id)
    else
      render :new    # implicit so therefore don't really need?
    end
  end

  def show
    @article = Article.find(:title)
  end

end

'''

# ##############

  private
    def article_params
      params.require(:article).permit(:title, :body)
    end

# ############# standard CRUD ... delete when finished #############


class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new params[:post]
    if @post.save
      redirect_to posts_path
    else
      render :action => 'new'
    end
  end

  def edit
    @post = Post.find params[:id]
  end

  def update
    @post = Post.find params[:id]
    if @post.update_attributes params[:post]
      redirect_to posts_path
    else
      render :action => :edit
    end
  end

  def destroy
    @post = Post.find params[:id]
    @post.destroy
    redirect_to posts_path
  end

  def show
    @post = Post.find params[:id]
  end

end
# '''
