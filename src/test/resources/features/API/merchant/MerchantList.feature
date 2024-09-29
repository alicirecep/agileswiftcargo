Feature: As an administrator (admin) I want to be able to access Merchant List via API connection.

  Scenario Outline: admin When a GET request is sent to the api/merchant/list endpoint with valid authorization,
  it should return a 200 status code, and for merchant with id(x), the response body should correctly contain (user_id,
  business_name, merchant_unique_id, current_balance, opening_balance, vat).

    * The api user sets "api/merchant/list" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies the information in the response body for the entry with the specified <dataindex> index, including <user_id>, "<business_name>", "<merchant_unique_id>", "<current_balance>", "<opening_balance>" and "<vat>".

    Examples:
      | dataindex | user_id | business_name | merchant_unique_id | current_balance | opening_balance | vat  |
      | 0         | 1213    | Granula GMBH  | 335714             | 0.00            | 0.00            | 0.00 |
      | 2         | 1211    | Granula GMBH  | 656067             | 0.00            | 0.00            | 0.00 |


  Scenario: Invalid Token When a GET request is sent to the api/merchant/list endpoint with invalid authorization,
  it should return a 401 status code, and the response body message should be 'Unauthenticated.'

    * The api user sets "api/merchant/list" path parameters.
    * The api user sends a "GET" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.

