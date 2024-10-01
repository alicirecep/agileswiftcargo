Feature: As an administrator (admin) I want to be able to create a new blog record via an API connection.

  Scenario: admin When sending a POST request with valid authorization and correct data (title, description, position, status)
  to the api/blog/add endpoint, the status code should be 200, and the response body should contain the message
  "New Blog Added". It should be verified that the new blog record is created by sending a GET request to the
  api/blog/{id} endpoint with the "New Blog ID" from the response body to confirm the creation.

    * The api user sets "api/blog/add" path parameters.
    * The api user prepares a POST request to send to the api "blog" add endpoint.
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "New Blog Added".
    * The api user verifies that the "title" is "Blog 35" by sending a GET request to the "api" "blog" endpoint with the "data" "New Blog ID" returned in the response body.


  Scenario: Invalid Token Validate that when a POST request with invalid authorization information and valid data
  (title, description, position, status) is sent to the api/blog/add endpoint, the response status code is 401,
  and the response body contains the message "Unauthenticated."

    * The api user sets "api/blog/add" path parameters.
    * The api user prepares a POST request to send to the api "blog" add endpoint.
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 401.
    * The api user verifies that the "message" information in the response body is "Unauthenticated.".

