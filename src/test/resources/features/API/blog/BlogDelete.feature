Feature: As an administrator (admin), I want to be able to delete blog information with the specified id number via API connection.

  @Delete
  Scenario: admin BLOG Validate that when a DELETE request with valid authorization and a correct (id) is sent to the
  api/blog/delete/{id} endpoint, the response status code is 200, and the response body contains the message "Deleted".
  Verify that the Deleted ID in the response matches the id in the path parameter. Confirm that the blog record has been
  successfully deleted by sending a GET request to api/blog/{id} to verify the record no longer exists.

    * The api user sets "api/blog/delete" path parameters.
    * The api user sends a "DELETE" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "Deleted".
    * The api user verifies that the "data" "Deleted ID" information in the returned response body is the same as the id path parameter written in the endpoint.
    * The api user verifies that the "message" is "there is no blog with this id" by sending a GET request to the "api" "blog" endpoint with the "data" "Deleted ID" returned in the response body.


  Scenario: admin Validate that when a DELETE request without an (id) is sent to the api/blog/delete/{id} endpoint with
  valid authorization, the response status code is 203, and the response body contains the message "No id."

    * The api user sets "api/blog/delete" path parameters.
    * The api user sends a "DELETE" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "No id.".


  Scenario: admin Validate that when a DELETE request with a non-existent (id) is sent to the api/blog/delete/{id}
  endpoint with valid authorization, the response status code is 203, and the response body contains the message
  "there is no blog with this id"

    * The api user sets "api/blog/delete/3652" path parameters.
    * The api user sends a "DELETE" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "there is no blog with this id".

  @Delete
  Scenario: Invalid Token BLOG Validate that when a DELETE request is sent to the api/blog/delete/{id} endpoint with
  invalid authorization, the response status code is 401, and the response body contains the message "Unauthenticated."

    * The api user sets "api/blog/delete" path parameters.
    * The api user sends a "DELETE" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.

