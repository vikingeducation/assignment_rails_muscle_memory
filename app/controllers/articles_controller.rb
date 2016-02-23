class ArticlesController < ApplicationController

  def new
    @article = Article.new
  end

=begin
  1. Build the create method for your form. (DONE)
  2. To create an object in Rails, you pass Article.new(...) a hash of the attributes you want to create. (DONE)
  3. In this case, that means the :body and :title attributes. (DONE)
  3. You then save the object with your_object.save. (DONE)
  4. If the save succeeds, it will return true.
  5. If it fails, it will return false. 

  Use this (we laid out the basic approach in the previous lessons) to set up your controller action so it will receive the form submission and create a new Article with it.
=end
  def create
    @article = Article.new({:title => params["title"], :body => params["body"]})
    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

=begin
  The "Show" Action

  The Show action is designed to show an individual resource.

  1. Set up a route for "show"ing a specific resource based on its ID. Make sure you're following the RESTful convention.
  2. Try visiting this route, e.g. /articles/1. You should get an error because we haven't set up the controller yet. (Done)
  3. Set up the controller action for show to retrieve the specified article from the database by its ID.
  *** The method you want here is Article.find( your_id ).
  4. Set up the Show view which takes the found article and displays its title and body content. (Done)
  5. Verify that you can now create an Article using the New form and it sends you to the page which displays that article. (Done)
=end
  def show
    @article=Article.find(params[:id])
  end
end
