Feature: As an administrator (admin) I want to be able to access the entire express pickup list via API connection.

  Scenario Outline: admin When a GET request with valid authorization is sent to the api/pickuprequest/express endpoint,
  verify that the status code is 200 and that the response body contains the details for the specific ID (x), including
  request_type, merchant_id, address, note, parcel_quantity, name, phone, cod_amount, invoice, weight, exchange, created_at,
  and updated_at.

    * The api user sets "api/pickuprequest/express" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies the information in the response body for the entry with the specified <dataindex> index, including "<request_type>", <merchant_id>, "<address>", <parcel_quantity>, "<name>", "<phone>", <exchange>, "<created_at>" and "<updated_at>".

    Examples:
      | dataindex | request_type | merchant_id | address       | parcel_quantity | name            | phone     | exchange | created_at                  | updated_at                  |
      | 0         | 2            | 464         | New York City | 0               | HasanKucukselek | 123123123 | 0        | 2024-09-29T12:45:24.000000Z | 2024-09-29T12:45:24.000000Z |

  Scenario: Invalid Token When a GET request with invalid authorization is sent to the api/pickuprequest/express endpoint,
  verify that the status code is 401 and the response body contains the message "Unauthenticated."

    * The api user sets "api/pickuprequest/express" path parameters.
    * The api user sends a "GET" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.

