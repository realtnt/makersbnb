$:.unshift File.join(File.dirname(__FILE__), 'lib')
require "database_connection"

# This file sets up the database tables. If you change any of the contents
# of this file, you should rerun `ruby reset_tables.rb` to ensure that your
# database tables are re-created.

def reset_tables(db)
  db.run("DROP TABLE IF EXISTS animals;")
  db.run("CREATE TABLE animals (id SERIAL PRIMARY KEY, species TEXT NOT NULL);")

  db.run("DROP TABLE IF EXISTS users;")
  db.run(
    "CREATE TABLE users (id SERIAL PRIMARY KEY, 
    name TEXT NOT NULL, email TEXT NOT NULL, 
    password TEXT NOT NULL);")

  db.run("DROP TABLE IF EXISTS spaces;")
  db.run(
    "CREATE TABLE spaces (id SERIAL PRIMARY KEY, 
    host_id INT, title TEXT NOT NULL, price INT NOT NULL, 
    description TEXT NOT NULL, date_from DATE NOT NULL, date_to DATE NOT NULL,
    img_url TEXT);"
    )

  db.run("DROP TABLE IF EXISTS requests;")
  db.run(
    "CREATE TABLE requests (id SERIAL PRIMARY KEY, 
    visitor_id INT NOT NULL, space_id INT NOT NULL, 
    date DATE NOT NULL);"
    )

  db.run("DROP TABLE IF EXISTS bookings;")
  db.run(
    "CREATE TABLE bookings (id SERIAL PRIMARY KEY, 
    visitor_id INT NOT NULL, request_id INT NOT NULL, 
    space_id INT NOT NULL, date DATE NOT NULL);"
    )

  db.run("DROP TABLE IF EXISTS user_requests;")
  db.run("CREATE TABLE user_requests (visitor_id INT NOT NULL, request_id INT NOT NULL);")

  db.run("DROP TABLE IF EXISTS space_requests;")
  db.run("CREATE TABLE space_requests (space_id INT NOT NULL, request_id INT NOT NULL);")

  db.run("DROP TABLE IF EXISTS space_bookings;")
  db.run("CREATE TABLE space_bookings (space_id INT NOT NULL, booking_id INT NOT NULL);")
  
  # Add your table creation SQL here
  # Each one should be a pair of lines:
  #   db.run("DROP TABLE IF EXISTS ...;")
  #   db.run("CREATE TABLE ... (id SERIAL PRIMARY KEY, ...);")
end

dev_db = DatabaseConnection.new("localhost", "web_application_dev")
reset_tables(dev_db)

test_db = DatabaseConnection.new("localhost", "web_application_test")
reset_tables(test_db)
