Feature: As an administrator (admin), I want to be able to delete pickup information with the specified id number via API connection.

  @Delete
  Scenario: admin EXPRESS When a DELETE request is sent to the api/pickuprequest/delete/{id} endpoint with valid authorization
  and the correct (id), verify that the status code is 200 and the response body contains the message "Deleted". Additionally,
  confirm that the "deleted data" in the response body matches the (id) specified in the endpoint path parameter, and ensure
  that the pickup record is successfully deleted by sending a GET request to the api/pickuprequest/{id} endpoint to verify
  the record's absence.

    * The api user sets "api/pickuprequest/delete" path parameters.
    * The api user sends a "DELETE" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "Deleted".
    * The api user verifies that the "data" "deleted data" information in the returned response body is the same as the id path parameter written in the endpoint.
    * The api user verifies that the "message" is "there is no pickup with this id." by sending a GET request to the "api" "pickuprequest" endpoint with the "data" "deleted data" returned in the response body.


  Scenario: admin When a DELETE request is sent to the api/pickuprequest/delete/{id} endpoint with valid authorization but
  without an (id), verify that the status code is 203 and the response body contains the message "No id."

    * The api user sets "api/pickuprequest/delete" path parameters.
    * The api user sends a "DELETE" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "No id.".


  Scenario: admin When a DELETE request is sent to the api/pickuprequest/delete/{id} endpoint with valid authorization and
  a non-existent (id), verify that the status code is 203 and the response body contains the message
  "there is no request with this id"

    * The api user sets "api/pickuprequest/delete/9562" path parameters.
    * The api user sends a "DELETE" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "there is no request with this id".

  @Delete
  Scenario: Invalid Token EXPRESS When a DELETE request is sent to the api/pickuprequest/delete/{id} endpoint with invalid
  authorization, verify that the status code is 401 and the response body contains the message "Unauthenticated."

    * The api user sets "api/pickuprequest/delete" path parameters.
    * The api user sends a "DELETE" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.
