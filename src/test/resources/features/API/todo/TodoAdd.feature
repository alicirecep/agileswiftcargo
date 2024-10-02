Feature: As an administrator (admin) I want to be able to create a new todo record via API connection.

  Scenario: admin Verify that a new ToDo is successfully created by sending a valid POST request to api/todo/add.
  Confirm the response has status code 200 and message "New ToDo Added". Then, validate the creation by sending a GET
  request to api/todo/{id} using the "New ToDo ID" from the response body.

    * The api user sets "api/todo/add" path parameters.
    * The api user prepares a POST request to send to the api "todo" add endpoint.
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "New ToDo Added".
    * The api user verifies that the "title" is "Test" by sending a GET request to the "api" "todo" endpoint with the "data" "New ToDo ID" returned in the response body.


  Scenario: Invalid Token Verify that sending a POST request with invalid authorization to api/todo/add returns a 401
  status code and the response message "Unauthenticated."

    * The api user sets "api/todo/add" path parameters.
    * The api user prepares a POST request to send to the api "todo" add endpoint.
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 401.
    * The api user verifies that the "message" information in the response body is "Unauthenticated.".
