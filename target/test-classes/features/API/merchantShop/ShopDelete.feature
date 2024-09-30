Feature: As an administrator (admin), I want to be able to delete shop information with the specified id number via API connection.

  @Delete
  Scenario: admin SHOP When a DELETE request is sent to the api/shop/delete/{id} endpoint with valid authorization and a
  correct id, the status code should be 200, and the response message should be "Deleted". Additionally, the Deleted ID
  in the response body should match the path parameter id, and a subsequent GET request to api/shop/{id} should confirm
  that the shop has been deleted.

    * The api user sets "api/shop/delete" path parameters.
    * The api user sends a "DELETE" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "Deleted".
    * The api user verifies that the "data" "Deleted ID" information in the returned response body is the same as the id path parameter written in the endpoint.
    * The api user verifies that the "message" is "there is no shop with this id" by sending a GET request to the "api" "shop" endpoint with the "data" "Deleted ID" returned in the response body.


  Scenario: admin When a DELETE request is sent to the api/shop/delete/{id} endpoint without an id and with valid
  authorization, the status code should be 203, and the response message should be "No id.".

    * The api user sets "api/shop/delete" path parameters.
    * The api user sends a "DELETE" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "No id.".


  Scenario: admin When a DELETE request with valid authorization and a non-existent id is sent to the api/shop/delete/{id}
  endpoint, the status code should be 203, and the response message should be "there is no shop with this id".

    * The api user sets "api/shop/delete/9541" path parameters.
    * The api user sends a "DELETE" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "there is no shop with this id".

  @Delete
  Scenario: Invalid Token SHOP When a DELETE request with invalid authorization is sent to the api/shop/delete/{id} endpoint,
  the status code should be 401, and the response message should be "Unauthenticated."

    * The api user sets "api/shop/delete" path parameters.
    * The api user sends a "DELETE" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.
