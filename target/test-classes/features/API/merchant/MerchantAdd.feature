Feature: As an administrator (admin) I want to be able to create a new Merchant record via API connection.

  Scenario: admin When a POST request is sent to the api/merchant/add endpoint with valid authorization and correct data
  (name, business_name, mobile, email, password, address, hub_id, status), it should return a 200 status code and the
  message 'New Merchant Added'. The newly created merchant record should be verified by sending a GET request to
  the api/merchant/{id} endpoint using the 'New Merchant ID' from the response body.

    * The api user sets "api/merchant/add" path parameters.
    * The api user prepares a POST request to send to the api "merchant" add endpoint.
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "New Merchant Added".
    * The api user verifies that the "user.name" is "Merchant Test" by sending a GET request to the "api" "merchant" endpoint with the "data" "New Merchant ID" returned in the response body.


  Scenario: Invalid Token When a POST request is sent to the api/merchant/add endpoint with invalid authorization and
  correct data (name, business_name, mobile, email, password, address, hub_id, status), it should return a 401 status
  code and the message 'Unauthenticated.'


    * The api user sets "api/merchant/add" path parameters.
    * The api user prepares a POST request to send to the api "merchant" add endpoint.
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 401.
    * The api user verifies that the "message" information in the response body is "Unauthenticated.".


