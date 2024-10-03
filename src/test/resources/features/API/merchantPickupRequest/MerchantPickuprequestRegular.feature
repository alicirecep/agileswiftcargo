Feature: As a merchant, I want to be able to access the regular pickup list via API connection.

  Scenario Outline: merchant Verify that when a GET request is sent to the api/merchant-pickuprequest/regular endpoint with
  valid authorization, the response returns a status code of 200. Additionally, confirm that the response body contains the
  expected information for the entry with ID(x), including (request_type, merchant_id, address, note, parcel_quantity, name,
  phone, cod_amount, invoice, weight, exchange, created_at, updated_at).

    * The api user sets "api/merchant-pickuprequest/regular" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies the information in the response for the entry with the specified <dataindex> index, including "<request_type>", <merchant_id>, "<address>", "<note>", <parcel_quantity>, "<cod_amount>", <weight>, <exchange>, "<created_at>" and "<updated_at>".

    Examples:
      | dataindex | request_type | merchant_id | address       | note                            | parcel_quantity | cod_amount | weight | exchange | created_at                  | updated_at                  |
      | 0         | 1            | 464         | New York City | En hizli ve güvenilir tek adres | 7               | 0.00       | 0      | 0        | 2024-10-03T12:21:11.000000Z | 2024-10-03T12:21:11.000000Z |


  Scenario: Invalid Token Verify that when a GET request is sent to the api/merchant-pickuprequest/regular endpoint with
  invalid authorization, the response returns a status code of 401, and the response body contains the message "Unauthenticated."

    * The api user sets "api/merchant-pickuprequest/regular" path parameters.
    * The api user sends a "GET" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.
