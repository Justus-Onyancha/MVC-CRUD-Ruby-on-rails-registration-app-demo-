# README

* ...
![Lang](https://img.shields.io/badge/language-Ruby-red)
![db](https://img.shields.io/badge/db-PostgreSql-yellow)
![Coverage Status](https://img.shields.io/badge/coverage-99%25-brightgreen)

* Ruby version 2.7.0

# Rails Model View Controller

## Objectives

- Describe where MVC goes in a Rails application structure
- Follow an http request from browser to router to controller to model to view to response to browser

## Model View Controller Overview

In order to ensure that applications have a specific organizational structure, the creators of Rails utilized the model-view-controller architecture. This concept can be a little abstract if you've never used it before, so let's give it a real world analogy.

In a restaurant kitchen we have three key components:

* A chef that makes the food

* A waiter that takes the order and brings out the food

* A table where the food is served to the customer

Using this as an analogy, we can assign the following roles to each of our restaurant components:

* Model - The model is the chef, it should manage the critical aspects of the application. One of my favorite tasks in a Rails application is working with the model files. This is where you can be very expressive with the custom algorithms that you want to utilize and you also have direct access to the specific database record. The logic of your application should mainly reside in the model files.

* Controller - The controller is the waiter. In the same way that the waiter takes the order from the customer to the chef and then brings the food to the table, the controller transmits data requests from the user to the model, and then delivers data that is rendered in the view to the user.

* View - The view is the table. A table shouldn't do anything besides sit there and hold the food when it is delivered. In like manner the views should not contain any programming logic, they should simply render what the controller sends it. One of the top issues I discover when I review a Rails application that has a large number of bugs is that the developer integrated too much logic directly into the view.

## Routing, File Naming Conventions, and Data Flow

Rails was created with the concept of convention over configuration and this holds true for how the MVC structure was setup. View files correspond directly to controller files, which speak directly with models. As an example, imagine that you have a blog that has a database table called `posts`. You will have the following set of files:

* A `post.rb` model file that will contain: validations, database relationships, callbacks, and any custom logic for posts.

* A `posts_controller.rb` file that will have methods to manage data flow for the Post behavior, including the full set of CRUD features. The standard methods are: `index`, `new`, `create`, `show`, `edit`, `update`, and `destroy`.

* A `views/` directory that will contain a corresponding view for each of the pages that the end user will access. For a CRUD based model, a few of the standard views would include: an `index` view to show all records, a `show` page that shows a specific record, and then `new` and `edit` pages that each render a form.

## Request Flow

![MVC Request Flow](https://s3.amazonaws.com/flatiron-bucket/readme-lessons/mvc_flow_updated.png)

## Roles and Responsibilities

### Models

At the end of the day, the model file is a Ruby class. If it has a corresponding database table, it will inherit from the `ActiveRecord::Base` class, which means that it can access a number of methods that assist in working with the database. However, you can treat it like a regular Ruby class, allowing you to create methods, data attributes, and everything else that you would want to do in a class file. In a typical model file you will find your application's domain logic. To extend the restaurant analogy, the chef (your model) performs a number of tasks to create each meal that the waiter (controller) and especially the table (views) don't know anything about. Some of this domain logic would include items such as complex database queries, data relationships, and custom algorithms.

It is important to remember to follow the single responsibility principle for your model class files. If any of the methods that you place in the model file perform tasks outside the scope of that specific model, they should probably be moved to their own class.

### Controllers

As mentioned before, the controller is like the waiter in a restaurant. The controllers connect the models, views, and routes. To make it even more straightforward, think in terms of the following process:

* The view looks to the controller and only has access to the instance variables that the controller makes available. Those instance variables will contain any/all data coming in from the database.

* The routes file looks to the controller and ensures that the methods in the controller match the items in the routes file.

Remembering our restaurant analogy, the easiest way to think of the controller is that it manages data flow between the router, model, and views, in the same way that a waiter takes the order from a patron, relays the order details to the chef, and brings the meal out to the table.

### Views

In a Rails application, the view files should contain the least amount of logic of any of the files in the model-view-controller architecture. The role of the view is to simply render whatever it is sent from the database.

Rails also does a great job of supplying built in ActionView helper methods that you can implement to efficiently code the views. For example, if you wanted to create a `div` for a set of blog posts that you want to iterate over, you can implement the following code:

```erb
<%= content_tag(:div, @post, class: "post-index-page") do %>
  <%= content_tag(:p, "#{@post.title}: #{@post.summary}") %>
<% end %>
```

Which is translated to the following HTML markup:

```html
<div id="post_42" class="post post-index-page">
  <p>My Amazing Blog Post: With an incredible summary</p>
</div>
```

Notice how the Action View helper enabled us to dynamically set the HTML tags without having to write any HTML code at all? You will discover that this is a very helpful tool as your views grow in size. The more Ruby and the less HTML you write, the cleaner your views will be, resulting in them being easier to manage and scale.



# Ruby CRUD
A ruby CRUD(Create, Read, Update, Delete) using MVC pattern

## About
I use active record to control postgreSql like ruby on rails .
but it's without Rails or any framework :v very simple

## Requires
1. Ruby
2. Postgresql (you can change if not like. only support SQL databases)


### What Does a Rails App Look Like? (5 minutes / 0:55)

As soon as we generate a Rails app, you can see there are already many folders
and files generated from just the one command (`rails new`)

![Rails folder structure](images/rails_folders.png)

While all these files may be daunting at first, you're already familiar with many of these components from your work with Sinatra. Additionally, you can ignore a lot of the other stuff until you need to
incorporate some weird gem or dependency. So we started learning about *"convention
over configuration"* during the class for Active Record.

As we scale to a Rails size application, We can quickly see the need for conventions in such a massive
framework. Specifically for folder and file structure, Rails can be quite
particular about how we name things. Throughout this week we'll be going through
a bunch of different conventions we need to follow.

The first folder we'll talk about is the `app` folder...

![Rails app folder](images/rails_app.png)

This folder is the the most important folder in your entire application. It will contain
most of the programs functionality.

- **`assets`**: this will be where all of your CSS, JS, and image files belong.
- **`controllers`**: this folder will contain all controllers.
- **`models`**: this folder will contain our models.
- **`views`**: this folder contains all of the views in this application.

The `bin` folder contains binstubs. Not going over this in the scope of this
class, but basically they're used as wrappers around ruby gem executables - like
`pry` - to be used in lieu of `bundle exec`. Their purpose is to prepare the environment for the executable.

The `config` is another folder that's pretty important. The file you'll most be
visiting is `routes.rb` This is the router in rMVC.

The `db` folder is one you'll be working in for a bit of time as well. This
contains the schema and seed files. Additionally, it will also contain your migrations,
which you'll be going over in the next class.

In the root directory of the application you will also see a `Gemfile` and, if you've run `bundle install`, `Gemfile.lock`
## Setup
set configuration, db ,etc 
> ```config/config.rb```

install gems
> ```rake gem:install```

create table db
> ```rake db:migrate```

## Test
rspec
> ```rake run:rspec```

## Run
Terminal :
```rake run:term```

Web :
```rake run:web```


## Structure table
###### moringa => ::name::,::lastname::,::unmber:: (id,created_at,updated_at . autoGenerate)

## License
MIT License.



## Contact me

If u wanna learning or contribuit with me to learning or anything u want please contact me
* justus.onyancha@moringaschool.com

## License

The Switch-Home code is available at GitHub under the Open-Source MIT license.

> Developed by Justus Onyancha with Love and coffee. 
