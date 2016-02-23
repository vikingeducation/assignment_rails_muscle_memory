class ArticlesController < ApplicationController

  def new
    @article = Article.new
  end

  def create
    @article = Article.new({:title => params["title"], :body => params["body"]})
    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  def show
    @article=Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

=begin
  The "Edit" Action

  The "edit" action is like a cross between "show" and "new": it's a form with all the values pre-filled in from your existing object. When you click submit, it sends your new values back to the controller, which will then update and save your existing object.

  1. Set up a route to handle the edit action. (Done)

  2. Set up the #edit action of your controller to retrieve an @article by ID, just like your #show action. (Done)

  3. The form method should be POST, because Rails can't accept a PATCH request directly. Instead, you're going to add a hidden input tag that looks like this: <input name="_method" type="hidden" value="patch" />

  4. Build the edit view template that looks much like your create form. It should have a header that looks like "Update Article #3"

  5. For each input field, however, you want something that looks like this, which actually sets your values dynamically: language-markup
  <input type="text" name="title" value="<%= @article.title %>" > (Done)

  6. Set the form's action to the update URL for your article. Use URL helpers. (Done)

  7. On your Index page, add a link to "Edit this Article" for each article
=end
  def edit
    @article = Article.find(params[:id])
  end

end
