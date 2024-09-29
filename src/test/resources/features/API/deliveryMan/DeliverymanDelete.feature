Feature: As an administrator (admin), I want to be able to delete Delivery man information with the specified id number via API connection.

  @Delete
  Scenario: admin DELIVERY When a DELETE request with valid authorization and the correct {id} is sent to the
  api/deliveryman/delete/{id} endpoint, it should return a 200 status code with the message 'Deleted' The 'Deleted id'
  in the response should match the {id} in the request, and the deletion should be verified by sending a GET request
  to api/deliveryman/{id} to confirm the record is removed.

    * The api user sets "api/deliveryman/delete" path parameters.
    * The api user sends a "DELETE" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "Deleted".
    * The api user verifies that the "data" "Deleted id" information in the returned response body is the same as the id path parameter written in the endpoint.
    * The api user verifies that the "message" is "there is no deliveryman with this id" by sending a GET request to the "api" "deliveryman" endpoint with the "data" "Deleted id" returned in the response body.


  Scenario: admin When a DELETE request without an {id} is sent to the api/deliveryman/delete/{id} endpoint with valid
  authorization, it should return a 203 status code and the message 'No id.'

    * The api user sets "api/deliveryman/delete" path parameters.
    * The api user sends a "DELETE" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "No id.".


  Scenario: admin When a DELETE request with a non-existent {id} is sent to the api/deliveryman/delete/{id} endpoint
  with valid authorization, it should return a 203 status code and the message 'there is no deliveryman with this id'

    * The api user sets "api/deliveryman/delete/6352" path parameters.
    * The api user sends a "DELETE" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "there is no deliveryman with this id".


  @Delete
  Scenario: Invalid Token DELIVERY When a DELETE request is sent to the api/deliveryman/delete/{id} endpoint with
  invalid authorization, it should return a 401 status code and the message 'Unauthenticated.'

    * The api user sets "api/deliveryman/delete" path parameters.
    * The api user sends a "DELETE" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.
