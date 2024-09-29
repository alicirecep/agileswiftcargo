Feature: As an administrator (admin), I want to be able to delete merchant information with the specified id number via API connection.

  @Delete
  Scenario: admin MERCHANT When a valid DELETE request is sent to the api/merchant/delete/{id} endpoint with valid
  authorization and the correct id, it must return a status code of 200 with the message "Deleted". The "Deleted id"
  in the response body must match the id path parameter, and the deletion of the merchant record should be verified
  by sending a GET request to api/merchant/{id} to ensure the record no longer exists.

    * The api user sets "api/merchant/delete" path parameters.
    * The api user sends a "DELETE" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "Deleted".
    * The api user verifies that the "data" "Deleted id" information in the returned response body is the same as the id path parameter written in the endpoint.
    * The api user verifies that the "message" is "there is no merchant with this id" by sending a GET request to the "api" "merchant" endpoint with the "data" "Deleted id" returned in the response body.


  Scenario: admin When a DELETE request is sent to the api/merchant/delete/{id} endpoint with valid authorization and no id,
  it must return a status code of 203 with the message "No id."

    * The api user sets "api/merchant/delete" path parameters.
    * The api user sends a "DELETE" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "No id.".


  Scenario: admin When a DELETE request is sent to the api/merchant/delete/{id} endpoint with valid authorization
  and a non-existent id, it must return a status code of 203 with the message "there is no merchant with this id"

    * The api user sets "api/merchant/delete/3625" path parameters.
    * The api user sends a "DELETE" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "there is no merchant with this id".

  @Delete
  Scenario: Invalid Token MERCHANT When an invalid authorization is used to send a DELETE request to the api/merchant/delete/{id}
  endpoint, it must return a status code of 401 with the message "Unauthenticated."

    * The api user sets "api/merchant/delete" path parameters.
    * The api user sends a "DELETE" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.

