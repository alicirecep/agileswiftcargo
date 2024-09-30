Feature: As an administrator (admin), I want to be able to delete packaging information with the specified id number via API connection.

  @Delete
  Scenario: admin PACKAGING When sending a DELETE request to the api/packaging/delete/{id} endpoint with valid authorization
  and the correct (id), the status code returned should be 200, and the response body should contain the message "Deleted".
  Additionally, the "Deleted ID" in the response body should match the (id) provided in the request, confirming that the
  packaging record has been successfully deleted, which can be verified by sending a GET request to api/packaging/{id}.

    * The api user sets "api/packaging/delete" path parameters.
    * The api user sends a "DELETE" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "Deleted".
    * The api user verifies that the "data" "Deleted ID" information in the returned response body is the same as the id path parameter written in the endpoint.
    * The api user verifies that the "message" is "there is no packaging with this id" by sending a GET request to the "api" "packaging" endpoint with the "data" "Deleted ID" returned in the response body.


  Scenario: admin When sending a DELETE request to the api/packaging/delete/{id} endpoint with valid authorization and a
  request that does not include an (id), the status code returned should be 203, and the response body should contain the
  message "No id."

    * The api user sets "api/packaging/delete" path parameters.
    * The api user sends a "DELETE" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "No id.".


  Scenario: admin When sending a DELETE request to the api/packaging/delete/{id} endpoint with valid authorization and a
  request that contains a non-existent (id), the status code returned should be 203, and the response body should contain
  the message "there is no packaging with this id"

    * The api user sets "api/packaging/delete/4523" path parameters.
    * The api user sends a "DELETE" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "there is no packaging with this id".

  @Delete
  Scenario: Invalid Token PACKAGING When sending a DELETE request to the api/packaging/delete/{id} endpoint with invalid authorization,
  the status code returned should be 401, and the response body should contain the message "Unauthenticated."

    * The api user sets "api/packaging/delete" path parameters.
    * The api user sends a "DELETE" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.
