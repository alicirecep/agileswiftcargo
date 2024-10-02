Feature: As a merchant, I want to be able to delete shop information with the specified id number via API connection.

  Scenario: merchant Verify that when a DELETE request is sent to the api/merchant-shop/delete/{id} endpoint with valid
  authorization and a correct (id), the response returns a status code of 200 and the response body contains the message
  "Deleted".

    * The api user sets "api/merchant-shop/delete/1042" path parameters.
    * The api user sends a "DELETE" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "Deleted".


  Scenario: merchant Verify that when a DELETE request is sent to the api/merchant-shop/delete/{id} endpoint with valid
  authorization and without an (id), the response returns a status code of 203 and the response body contains
  the message "No id."

    * The api user sets "api/merchant-shop/delete" path parameters.
    * The api user sends a "DELETE" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "No id.".


  Scenario: merchant Verify that when a DELETE request is sent to the api/merchant-shop/delete/{id} endpoint with valid
  authorization and a non-existent (id), the response returns a status code of 203 and the response body contains the
  message "Something went wrong."

    * The api user sets "api/merchant-shop/delete/98562" path parameters.
    * The api user sends a "DELETE" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "Something went wrong.".

  @US
  Scenario: Invalid Token Verify that when a DELETE request is sent to the api/merchant-shop/delete/{id} endpoint with
  invalid authorization, the response returns a status code of 401 and the response body contains the message "Unauthenticated."

    * The api user sets "api/merchant-shop/delete/1042" path parameters.
    * The api user sends a "DELETE" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.
