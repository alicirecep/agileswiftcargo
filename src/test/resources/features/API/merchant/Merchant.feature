Feature: As an administrator (admin), I want to be able to access the detailed information of the Merchant with the specified id number via the API connection.

  Scenario Outline: admin When a GET request is sent to the api/merchant/{id} endpoint with valid authorization and the
  correct (id), it should return a 200 status code, and the response body should contain the fields (id, user_id,
  business_name, merchant_unique_id, current_balance, opening_balance, vat).

    * The api user sets "api/merchant/<id>" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the data in the response body includes <id>, <user_id>, "<business_name>", "<merchant_unique_id>", "<current_balance>", "<opening_balance>" and "<vat>".

    Examples:
      | id  | id  | user_id | business_name                    | merchant_unique_id | current_balance | opening_balance | vat  |
      | 486 | 486 | 1005    | pouneh.admin@agileswiftcargo.com | 823223             | 0.00            | 0.00            | 0.00 |


  Scenario: admin When a GET request is sent to the api/merchant/{id} endpoint with valid authorization but without an (id),
  it should return a 203 status code, and the response body should contain the message 'No id.'

    * The api user sets "api/merchant" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "No id.".


  Scenario Outline: admin When a GET request is sent to the api/merchant/{id} endpoint with valid authorization and a
  non-existent (id), it should return a 203 status code, and the response body should contain the message
  'there is no merchant with this id'

    * The api user sets "api/merchant/<id>" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "there is no merchant with this id".

    Examples:
      | id   |
      | 5214 |


  Scenario Outline: Invalid Token When a GET request is sent to the api/merchant/{id} endpoint with invalid authorization,
  it should return a 401 status code, and the response body should contain the message 'Unauthenticated.'

    * The api user sets "api/merchant/<id>" path parameters.
    * The api user sends a "GET" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.

    Examples:
      | id  |
      | 486 |