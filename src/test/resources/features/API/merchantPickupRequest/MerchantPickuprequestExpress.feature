Feature: As a merchant, I want to be able to access the express pickup list via API connection.

  Scenario Outline: merchant When sending a GET request to the api/merchant-pickuprequest/express endpoint with valid
  authorization credentials, it should return a status code of 200, and the response body should include the information
  fields: request_type, merchant_id, address, note, parcel_quantity, name, phone, cod_amount, invoice, weight, exchange,
  created_at, and updated_at.

    * The api user sets "api/merchant-pickuprequest/express" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies the information in the response for the entry with the specified <dataindex> index, including "<request_type>", <merchant_id>, "<address>", <parcel_quantity>, "<name>", "<phone>", <exchange>, "<created_at>" and "<updated_at>".

    Examples:
      | dataindex | request_type | merchant_id | address | parcel_quantity | name                          | phone       | exchange | created_at                  | updated_at                  |
      | 0         | 2            | 464         | Arizona | 0               | Test Express Pickup Request 2 | 14785236987 | 0        | 2024-10-03T12:02:47.000000Z | 2024-10-03T12:02:47.000000Z |

  Scenario: Invalid Token Verify that when a GET request is sent to the api/merchant-pickuprequest/express endpoint with
  invalid authorization, the response returns a status code of 401, and the response body contains the message "Unauthenticated."

    * The api user sets "api/merchant-pickuprequest/express" path parameters.
    * The api user sends a "GET" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.
