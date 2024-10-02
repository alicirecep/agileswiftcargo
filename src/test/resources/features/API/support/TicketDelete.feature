Feature: As an administrator (admin), I want to be able to delete ticket information with the specified id number via API connection.

  @Delete
  Scenario: admin TICKET Verify that sending a DELETE request with valid authorization and a correct ID to
  api/ticket/delete/{id} returns a 200 status code and the message "Deleted." Additionally, confirm that the
  "Deleted ID" in the response body matches the path parameter ID and that the ticket is successfully deleted by
  sending a GET request to api/ticket/{id} using the returned ID.

    * The api user sets "api/ticket/delete" path parameters.
    * The api user sends a "DELETE" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "Deleted".
    * The api user verifies that the "data" "Deleted ID" information in the returned response body is the same as the id path parameter written in the endpoint.
    * The api user verifies that the "message" is "No id or there is no ticket with this id" by sending a GET request to the "api" "ticket" endpoint with the "data" "Deleted ID" returned in the response body.


  Scenario: admin Verify that sending a DELETE request with valid authorization but no ID to api/ticket/delete/{id} returns
  a 203 status code and the message "No id." in the response body.

    * The api user sets "api/ticket/delete" path parameters.
    * The api user sends a "DELETE" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "No id.".


  Scenario: admin Verify that sending a DELETE request with valid authorization and a non-existent ID to
  api/ticket/delete/{id} returns a 203 status code and the message "No id or there is no ticket with this id"
  in the response body.

    * The api user sets "api/ticket/delete/6241" path parameters.
    * The api user sends a "DELETE" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "No id or there is no ticket with this id".

  @Delete
  Scenario: Invalid Token TICKET Verify that sending a DELETE request with invalid authorization to api/ticket/delete/{id}
  returns a 401 status code and the message "Unauthenticated." in the response body.

    * The api user sets "api/ticket/delete" path parameters.
    * The api user sends a "DELETE" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.

