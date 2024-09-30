Feature: As an administrator (admin) I want to be able to create a new express pickup record via API connection.

  Scenario: admin When a POST request with valid authorization is sent to the api/pickuprequest/express/add endpoint with
  the correct data (merchant_id, address, name, phone) in the body, verify that the status code is 200 and the response
  body contains the message "Pickup Request Added". Additionally, confirm that the new express pickup record is created
  by sending a GET request to the api/pickuprequest/{id} endpoint using the "New Pickup Request ID" from the response body.

    * The api user sets "api/pickuprequest/express/add" path parameters.
    * The api user prepares a POST request to send to the api "express" add endpoint.
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "Pickup Request Added".
    * The api user verifies that the "address" is "Arizona" by sending a GET request to the "api" "pickuprequest" endpoint with the "data" "New Pickup Request  ID" returned in the response body.


  Scenario Outline: admin When a POST request is sent to the api/pickuprequest/express/add endpoint with valid authorization
  and a body containing missing data (address, name, phone, but no merchant_id), verify that the status code is 400 and the
  response body contains the message "No merchant id."

    * The api user sets "api/pickuprequest/express/add" path parameters.
    * The api user prepares a POST request containing "<address>", "<name>" and "<phone>" information to send to the api expressadd endpoint.
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 400.
    * The api user verifies that the "message" information in the response body is "No merchant id.".

    Examples:
      | address | name                          | phone       |
      | Arizona | Test Express Pickup Request 2 | 14785236987 |


  Scenario Outline: admin When a POST request is sent to the api/pickuprequest/express/add endpoint with valid authorization
  and a body containing an invalid merchant_id (along with address, name, and phone), verify that the status code is 400
  and the response body contains the message "there is no merchant with this id."

    * The api user sets "api/pickuprequest/express/add" path parameters.
    * The api user prepares a POST request containing <merchant_id>, "<address>", "<name>" and "<phone>" information to send to the api expressadd endpoint.
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 400.
    * The api user verifies that the "message" information in the response body is "there is no merchant with this id.".

    Examples:
      | merchant_id | address | name                          | phone       |
      | 200         | Arizona | Test Express Pickup Request 2 | 14785236987 |


  Scenario: Invalid Token When a POST request is sent to the api/pickuprequest/express/add endpoint with invalid
  authorization and a body containing valid data (merchant_id, address, name, phone), verify that the status code
  is 401 and the response body contains the message "Unauthenticated."

    * The api user sets "api/pickuprequest/express/add" path parameters.
    * The api user prepares a POST request to send to the api "express" add endpoint.
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 401.
    * The api user verifies that the "message" information in the response body is "Unauthenticated.".
