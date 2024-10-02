Feature: As an administrator (admin), I want to be able to delete todo information with the specified id number via API connection.

  @Delete
  Scenario: admin TODO Verify that sending a DELETE request with valid authorization and a correct (id) to the
  api/todo/delete/{id} endpoint returns a 200 status code and the message "Deleted". Additionally, confirm that the
  "Deleted ID" in the response body matches the (id) specified in the path parameter. Finally, validate that the
  ToDo record has been deleted by sending a GET request to the api/todo/{id} endpoint and confirming that the record
  no longer exists.

    * The api user sets "api/todo/delete" path parameters.
    * The api user sends a "DELETE" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "Deleted".
    * The api user verifies that the "data" "Deleted ID" information in the returned response body is the same as the id path parameter written in the endpoint.
    * The api user verifies that the "message" is "No id or there is no ToDo with this id" by sending a GET request to the "api" "todo" endpoint with the "data" "Deleted ID" returned in the response body.


  Scenario: admin Verify that sending a DELETE request without an (id) to the api/todo/delete/{id} endpoint with valid
  authorization returns a 203 status code and the response body contains the message "No id."

    * The api user sets "api/todo/delete" path parameters.
    * The api user sends a "DELETE" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "No id.".


  Scenario: admin Verify that sending a DELETE request with a non-existent (id) to the api/todo/delete/{id} endpoint with
  valid authorization returns a 203 status code and the response body contains the message
  "No id or there is no ToDo with this id"

    * The api user sets "api/todo/delete/7412" path parameters.
    * The api user sends a "DELETE" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "No id or there is no ToDo with this id".


  @Patch
  Scenario: Invalid Token TODO Verify that sending a DELETE request with invalid authorization to the api/todo/delete/{id}
  endpoint returns a 401 status code and the response body contains the message "Unauthenticated."

    * The api user sets "api/todo/delete" path parameters.
    * The api user sends a "DELETE" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.

