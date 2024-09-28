Feature: As an administrator (admin) I want to be able to create a new Delivery man record via API connection.

  Scenario: admin When a POST request with valid authorization and correct data (name, mobile, email, password,
  address, hub_id, status) is sent to the api/deliveryman/add endpoint, it should return a 200 status code with the response
  body message 'New Delivery Man Added' The creation of the new deliveryman should be verified by sending a GET request to
  api/deliveryman/{id} using the 'deliveryman id' from the response body.

    * The api user sets "api/deliveryman/add" path parameters.
    * The api user prepares a POST request to send to the api "deliveryman" add endpoint.
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "New Delivery Man Added".
    * The api user verifies that the "data[0].user.name" is "Delivery Man 258" by sending a GET request to the "api" "deliveryman" endpoint with the "data" "deliveryman id" returned in the response body.


  Scenario: Invalid Token When a POST request with invalid authorization and correct data (name, mobile, email, password,
  address, hub_id, status) is sent to the api/deliveryman/add endpoint, it should return a 401 status code with the response
  body message 'Unauthenticated.'

    * The api user sets "api/deliveryman/add" path parameters.
    * The api user prepares a POST request to send to the api "deliveryman" add endpoint.
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 401.
    * The api user verifies that the "message" information in the response body is "Unauthenticated.".