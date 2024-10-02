Feature: As an administrator (admin) I want to be able to create a new ticket record via API connection.

  Scenario: admin Verify that sending a POST request with valid authorization and correct data to api/ticket/add returns a
  200 status code with the message "New Ticket Added". Confirm the new ticket is created by sending a GET request to
  api/ticket/{id} using the "New Ticket ID" from the response body.

    * The api user sets "api/ticket/add" path parameters.
    * The api user prepares a POST request to send to the api "ticket" add endpoint.
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "New Ticket Added".
    * The api user verifies that the "service" is "finans" by sending a GET request to the "api" "ticket" endpoint with the "data" "New Ticket ID" returned in the response body.


  Scenario: admin Verify that sending a POST request with valid authorization but no data to api/ticket/add returns a 400
  status code and the message "There is no data to update." in the response body.

    * The api user sets "api/ticket/add" path parameters.
    * The api user prepares a "POST" request that contains no data.
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 400.
    * The api user verifies that the "message" information in the response body is "There is no data to update.".


  Scenario: Invalid Token Verify that sending a POST request with invalid authorization and correct data to api/ticket/add
  returns a 401 status code and the message "Unauthenticated." in the response body.

    * The api user sets "api/ticket/add" path parameters.
    * The api user prepares a POST request to send to the api "ticket" add endpoint.
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 401.
    * The api user verifies that the "message" information in the response body is "Unauthenticated.".
