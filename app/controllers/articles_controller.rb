class ArticlesController < ApplicationController
  
  def new
	@article = Article.new	
  end

  def show
  	@article = Article.find(params[:id])
  end

  def index
  	@articles = Article.all
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update_attributes(whitelisted_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def create
  	@article = Article.new(whitelisted_params)
  	if @article.save
  		flash[:success]  = "Congrats!!! Your Article was saved...."
  	  redirect_to @article
  	else
  		flash.now[:error] = "Your article was not saved"
  		render 'new'
  	end
  end

  def destroy
    Article.find(params[:id]).destroy
    redirect_to(root_url)
  end

  private

  def whitelisted_params
  	params.require(:article).permit(:title, :body)
  end
end
