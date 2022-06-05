# makersbnb Web Design Recipe (Level Three)

![makersbnb logo](/public/makersbnb-whitebg-small.png)

## 1. Describe the Problem

_Put or write the user stories here. Add any clarifying notes you might have._

> As a visitor
>
> So that I choose a space to rent  
> 
> I want to see a list of available spaces


> As a host 
> 
> So that I can rent out a space
> 
> I want to post a listing with a title, description, price


> As a host
> 
> So that I car rent out all my spaces
> 
> I want to be able to post multiple listings


> As a host
> 
> So that I can schedule my bookings
> 
> I want to set the range of dates the space can be booked


> As a visitor
> 
> So that I can book a space for **one** night
> 
> I want to be able to send a hire request for a specific space


> As a host
> 
> So that I manage my space requests
> 
> I want to be able to accept or deny hire requests


> As a host
> 
> So that I don't get double bookings
> 
> Already booked dates are not available for requests


> As a user
> 
> So that I can book a space
> 
> I want to be able to create an account on Makersbee'n'bee


## 2. Design the Interface

_This is the fun part! Use excalidraw.com or a similar tool to design some
wireframes (rough sketches of the user interface). Include interactions and
transitions between pages — those are the most critical part._



## 3. Design the Database

_Design the data tables that will store all of the information your application
manages. Include the data types and examples of three rows. Consider use Google
Sheets or [AsciiTable](https://ozh.github.io/ascii-tables/) to do this._

## users table
|         users          |
|------------------------|
| id SERIAL PRIMARY  KEY |
| email TEXT             |
| password TEXT          |
| name TEXT              |


## spaces table

|              spaces               |
|-----------------------------------|
| id SERIAL PRIMARY KEY             |
| host_id INT REFERENCES users (id) |
| price INT                         |
| title TEXT                        |
| description TEXT                  |
| date_from DATE                    |
| date_to DATE                      |


## requests table

|               requests               |
|--------------------------------------|
| id SERIAL PRIMARY KEY                |
| visitor_id INT REFERENCES users (id) |
| space_id INT REFERENCES spaces (id)  |
| date DATE                            |


## bookings table

|                bookings                 |
|-----------------------------------------|
| id SERIAL PRIMARY KEY                   |
| visitor_id INT REFERENCES users (id)    |
| request_id INT REFERENCES requests (id) |
| space_id INT REFERENCES space (id)      |
| date DATE                               |


## messages table

|               messages                 |
|----------------------------------------|
| id SERIAL PRIMARY KEY                  |
| message TEXT                           |
| sent TIMESTAMP                         |
| received TIMESTAMP                     |
| sender_id INT REFERENCES users (id)    |
| recipient_id INT REFERENCES users (id) |

## 4. Create Examples of User Interactions

_Create examples of user interactions and expectations._

```ruby
# List Space
visit "/space/new"
expect(page).to have_content "List A Space"
# User sees: You have no diary entries.

```

## 6. Test-Drive the Behaviour

_Follow this cycle:_

1. Add a feature test in `/spec/feature/` (RED)
2. Implement the behaviour in `app.rb`
3. Does it pass without data model changes? (GREEN) Then skip to step 6.
4. Otherwise, add a unit test for the data model to `/spec/unit` (RED)
5. Implement the behaviour in your data model class. (GREEN)
6. Apply any refactors to improve the structure of the code. (REFACTOR)  
   Run `rubocop` as part of this.
7. Go back to step 1.
