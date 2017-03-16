solution_rails_muscle_memory
============================




## Overview

This assignment should've given you a chance to get used to the basic workflow of a Rails application. This may have felt like review from the earlier tutorials or this could've felt fairly new. Either way, you'll be amazed at how soon this setup and structure becomes routine.


## Reviewing Your Solution

Here's some questions to ask yourself while reviewing your code:

* Do you have a new article form?
* Does the form use the Rails CSRF token?
* Does your `create` action have a condition for when save succeeds and fails?
* Do you redirect to the article when successful?
* You you rerender the new form with error messages when creation fails?
* Do you have flash messages?
* Do you have a show page?
* Did you create a `nav` partial?
* Do you have an article index page listing all articles?
* Did you provide Edit and Delete buttons on your article index and show page?
* Did you remember to put `:method => :delete` in your delete button?
* Do you have an edit form with an input to tell Rails to interpret the action as a `PATCH` request?
* Do you populate the edit form with the `title` and `body` values from the article?
* Do you have an update action in your controller with conditions for success and failure?
* Do you redirect to the article on success and back to the edit form with errors on failure?
* Do you have a destroy action in your controller?
* Do you properly destroy the article when the destroy action is called?
* Do you have a success message for when deletion succeeds?


## Introducing Our Solution


### Installation

Clone the repo and `cd` into the project directory. Run `$ bundle install`. You make have to run `$ bundle update` if you get errors.

Now run `$ bundle exec rake db:migrate` and fire up the server with `$ rails s`. You should be able to view the application now at `http://localhost:3000`.


### Files

The important files to look are:

- `app/`
    - `controllers/articles_controller.rb`
    - `views/`
        - `articles/*.html.erb`
        - `layouts/application.html.erb`
        - `shared/*.html.erb`
    - `config/routes.rb`


### The App

Click around a bit and get a feel for how the app works. Create a few articles, edit them and delete them.


## Key Tips and Takeaways

1. **Always include success and failure conditions in your controller CRUD actions.** This is a simple pattern to follow when creating your `create`, `update` and `destroy` functions that you immediately benefit from. Make this a habit. Each of the Rails model methods `#save`, `#update` and `#destroy` returns a boolean. Use that boolean to determine what flash messages to display and where/how to redirect/render.

    ```ruby
    class ArticlesController < ApplicationController
      before_action :set_article, :except => [:index, :new, :create]

      #...

      def create
        @article = Article.new(article_params)
        if @article.save
          flash[:success] = 'Article created'
          redirect_to @article
        else
          flash.now[:error] = 'Article not created: ' +
            @article.errors.full_messages.join(', ')
          render :new
        end
      end


      def update
        if @article.update(article_params)
          flash[:success] = 'Article updated'
          redirect_to @article
        else
          flash.now[:error] = 'Article not updated: ' +
            @article.errors.full_messages.join(', ')
            render :edit
        end
      end


      def destroy
        if @article.destroy
          flash[:success] = 'Article destroyed'
        else
          flash[:error] = 'Article not destroyed: ' +
            @article.errors.full_messages.join(', ')
        end
        redirect_back(fallback_location: root_path)
      end

      #...
    end
    ```

1. **Use partials for navigation and flash messages.** It gets messy quick to put a huge chunk of HTML/ERB in your layout for navigation and flash messages. You may also want to have multiple layouts at some point. Use partials to DRY up your layouts and make them cleaner.

    ```erb
    <!-- layout -->
    < !DOCTYPE html>
    <html>
      <head>
        <title>SolutionRailsMuscleMemory</title>
        <%= stylesheet_link_tag    'application', media: 'all', 'data-turbolinks-track' => true %>
        <%= javascript_include_tag 'application', 'data-turbolinks-track' => true %>
        <%= csrf_meta_tags %>
      </head>
      <body>

        <%= render :partial => 'shared/nav' %>
        <%= render :partial => 'shared/flash' %>
        <%= yield %>

      </body>
    </html>
    ```

    ```erb
    <!-- flash partial -->
    <% unless flash.empty? %>

      <% flash.each do |key, value| %>
        <div class="flash alert-<%= flash_css_class(key) %>">
          <%= value %>
        </div>
      <% end %>

    <% end %>
    ```

    ```erb
    <!-- nav partial -->
    <nav>
      <ul>
        <li>
          <a href="<%= articles_path %>">Index</a>
        </li>
        <li>
          <a href="<%= new_article_path %>">New Article</a>
        </li>
      </ul>
    </nav>
    ```


1. **Include edit/delete buttons in your index and show pages.** This allows a user to edit/delete an article from the show page or the index instead of having to navigate to one or the other to delete/edit an article.

    ```erb
    <!-- index -->
    <% if @articles.empty? %>

      <p>No articles yet...</p>

    <% else %>

      <% @articles.each do |article| %>
        <h2>Article <%= link_to "ID\##{article.id}", article_path(article)  %></h2>
        <h3>Title: <%= link_to article.title, article %></h3>
        <p><strong>Body:</strong> <%= article.body %></p>
        <%= link_to('Edit', edit_article_path(article)) %>
        <%= link_to('Delete', article_path(article), :method => :delete, :data => { :confirm => 'Are you sure?' }) %>
        <hr>
      <% end %>

    <% end %>
    ```

    ```erb
    <!-- show -->
    <h1>Article ID#<%= @article.id %></h1>
    <h2>Title: <%= @article.title%></h2>
    <p><strong>Body:</strong> <%= @article.body %></p>
    <%= link_to('Edit', edit_article_path(@article)) %>
    <%= link_to('Delete', article_path(@article), :method => :delete, :data => { :confirm => 'Are you sure?' }) %>
    ```


## Good Student Solutions

* [Sia Karamalegos's Solution](https://github.com/siakaramalegos/assignment_rails_muscle_memory)
* [Chris Scavello's Solution](https://github.com/BideoWego/assignment_rails_muscle_memory)
* [Kit Langton's Solution](https://github.com/kitlangton/assignment_rails_muscle_memory)



** NOTE:** *This solution repo is copyrighted material for your private use only and not to be shared outside of Viking Code School.*







