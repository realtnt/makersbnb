# INSTRUCTIONS to make the new codebase work

## Pull the latest code from github.
`git pull`

## Run bundle to install the new gems.
`bundle`

## Start Postgres
### Ubuntu/WSL
`sudo service postgresql start`

### Mac
`; brew services start postgresql`

## Create dev and test databases
### Ubuntu/WSL
`sudo -u postgres psql`

`CREATE DATABASE makersbnb_dev;`

`CREATE DATABASE makersbnb_test;`

### Mac
`; createdb makersbnb_dev`

`; createdb makersbnb_test`

## Create database tables for dev database
`rake db:migrate`

## Create database tables for test database
`rake db:prepare`

Done!

Run `rspec` to verify they all pass.

Run `rackup` to start the server and check that the site works as expected.





  

# Level Three Web Application Starter Codebase

This is a starter codebase for building database-backed web applications. It
uses:

* `Ruby` (the language)
* `RSpec` (the testing tool)
* `Sinatra` (the web framework)
* `Capybara` (the web testing tool)
* `PostgreSQL` (the database)

It comes with a design recipe in [`recipe/recipe.md`](recipe/recipe.md) and a
fully developed example application for you to investigate.

## Quickstart

```shell
# Firstly, install and set up PostgreSQL
; brew install postgresql
; brew services start postgresql

# Then, clone and install this project
; git clone git@github.com:makersacademy/web-starter-level-three.git
; cd web-starter-level-three
; bundle install

# Create the databases and set up the tables
; createdb web_application_dev
; createdb web_application_test
; ruby reset_tables.rb

# And check the project is healthy
; rspec # To run the tests - all should pass
; rubocop # To verify code style
; rackup

# You should see something like this:
Connecting to database `web_application_dev`...
Connected to the database successfully.
* Puma version: 5.6.4 (ruby 3.0.1-p64) ("Birdie's Version")
*  Min threads: 0
*  Max threads: 5
*  Environment: development
*          PID: 60292
* Listening on http://127.0.0.1:9292
* Listening on http://[::1]:9292
Use Ctrl-C to stop

# This will then wait for requests indefinitely
# Try opening up another terminal and running:
; open localhost:9292/animals
```

Take a look around the project to see how it works. Then open up
`recipe/recipe.md` and get started.

## What do all the files do?

```shell
.
├── Gemfile # Specifies the project's dependencies (e.g. RSpec) 
├── Gemfile.lock # Stores the exact versions of dependencies used
├── README.md # This file
├── app.rb # The controller, which handles requests and coordinates the model and views to build responses.
├── config.ru # Specifies how to start the server
├── lib
│   ├── animal_entity.rb # (Example) Represents a single Animal
│   ├── animals_table.rb # (Example) Stores and retrieves Animals from the database
│   └── database_connection.rb # Connects to the database and relays queries
├── recipe
│   ├── diary_design.png # Example interface design
│   └── recipe.md # Design recipe for this kind of application
├── reset_tables.rb # Sets up all of the tables in the database
├── spec
│   ├── feature # Tests that simulate a user browsing the site
│   │   └── animals_feature_spec.rb 
│   ├── helpers
│   │   └── database_helpers.rb # Helper methods for re-setting the database in tests
│   ├── model # Tests of the data model component of the application
│   │   ├── animal_entity_spec.rb 
│   │   └── animals_table_spec.rb
│   └── spec_helper.rb # Sets up the test configuration
└── views
    ├── animals_edit.erb # View template for the animal edit page
    ├── animals_index.erb # View template for the animal index page
    ├── animals_new.erb # View template for the create a new animal form
    └── layout.erb # Overall website layout
```
