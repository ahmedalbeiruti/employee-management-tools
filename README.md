# employee-management-tools

## Prerequisites

* Ruby 2.6.5
* Rails 5.2.4
* SQLite3

## Installation

* Using terminal navigate to the directory of the application
* In terminal run  

  ``` bash
  bundle install
  ```

## Implementation Deatails

* The Relation between Employees and Tasks is a many to many relationship. That means an employee can have many tasks and tasks can belong to many employees.
* API allows for requsting of all employees using the endpoint

  ```http
  /emplloyees
  ```

  * It also allow for requesting only active employees using `active` parameter

    ```http
    /employees?active=true
    ```

* API allows for requesting of all tasks of a single employee.

  ```http
  /employees/[employee_id]/tasks
  ```

  * It allows requesting only tasks with future execution date using `future` parameter

    ```http
    /employees/[employee_id]/tasks?future=true
    ```

## Database

This App is using SQlite database (the default database in Rails).

### Create & Populate Database

* Use the following command to create and seed the Database for the first time

  ```bash
  bin/rails db:setup
  ```

* Seed the database with the data in the seed file (located in `db/seeds.rb`) with the following command
  
  ```bash
  bin/rails db:seed
  ```

* To reset database (delete and recreate), load the schema, and initialize with seed data use the command
  
  ```bash
  bin/rails db:reset
  ```

## Running & Using the API locally

Assuming the database has been created and populated with data

* In the project directory, Use the following command to startup Rails on local machine

  ```bash
  bin/rails s
  ```

* Using Postman you can
  * Request all employees (or acitve ones only)

    ```http
    localhost:3000/employees

    localhost:3000/employees?active=true
    ```

  * Request all tasks (or future ones) of a specific employee

    ``` http
    localhost:3000/employees/1/tasks

    localhost:3000/employees/1/tasks?future=true
    ```

## Run test suite

This Applicaiton is using RSpec Gem for testing. To run the test suite, use the following command from the project root

```bash
bundle exec rspec
# or
rspec
```
