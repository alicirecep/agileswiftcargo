Feature: As an administrator (admin) I want to be able to create a new shop record via API connection.

  Scenario: admin When a valid POST request is sent to the api/shop/add endpoint with valid authorization and the correct
  data (merchant_id, name, contact_no, address, status), it must return a status code of 200 with the message
  "New Shop Added". Additionally, the new shop record must be verified through the API by sending a GET request to
  api/shop/{id} using the "New Shop ID" from the response body.

    * The api user sets "api/shop/add" path parameters.
    * The api user prepares a POST request to send to the api "shop" add endpoint.
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "New Shop Added".
    * The api user verifies that the "name" is "Prof Cargo" by sending a GET request to the "api" "shop" endpoint with the "data" "New Shop ID" returned in the response body.


  Scenario Outline: admin When a POST request is sent to the api/shop/add endpoint with valid authorization and a body
  missing the merchant_id (including only name, contact_no, address, and status), it must return a status code of 400
  with the message "No merchant id."

    * The api user sets "api/shop/add" path parameters.
    * The api user prepares a POST request containing "<name>", "<contact_no>", "<address>" and <status> information to send to the api shopadd endpoint.
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 400.
    * The api user verifies that the "message" information in the response body is "No merchant id.".

    Examples:
      | name       | contact_no  | address  | status |
      | Prof Cargo | 33358975556 | New York | 1      |


  Scenario Outline: admin When a POST request is sent to the api/shop/add endpoint with valid authorization and an invalid
  merchant_id (along with name, contact_no, address, and status), it must return a status code of 400 with the message
  "there is no merchant with this id."

    * The api user sets "api/shop/add" path parameters.
    * The api user prepares a POST request containing <merchant_id>, "<name>", "<contact_no>", "<address>" and <status> information to send to the api shopadd endpoint.
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 400.
    * The api user verifies that the "message" information in the response body is "there is no merchant with this id.".

    Examples:
      | merchant_id | name       | contact_no  | address  | status |
      | 7           | Prof Cargo | 33358975556 | New York | 1      |


  Scenario: Invalid Token When a POST request is sent to the api/shop/add endpoint with invalid authorization and valid
  data (merchant_id, name, contact_no, address, status), it must return a status code of 401 with the message "Unauthenticated."

    * The api user sets "api/shop/add" path parameters.
    * The api user prepares a POST request to send to the api "shop" add endpoint.
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 401.
    * The api user verifies that the "message" information in the response body is "Unauthenticated.".

