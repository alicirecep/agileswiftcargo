Feature: As an administrator (admin) I want to be able to access the entire pickup list via API connection.

  Scenario Outline: admin When a GET request with valid authorization is sent to the api/pickuprequest/all endpoint,
  verify that the status code is 200. Additionally, validate that the response body contains the details for the request
  with id(x), including request_type, merchant_id, address, note, parcel_quantity, name, phone, cod_amount, invoice,
  weight, exchange, created_at, and updated_at.

    * The api user sets "api/pickuprequest/all" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies the information in the response body for the entry with the specified <dataindex> index, including "<request_type>", <merchant_id>, "<address>", "<note>", <parcel_quantity>, "<cod_amount>", <weight>, <exchange>, "<created_at>" and "<updated_at>".

    Examples:
      | dataindex | request_type | merchant_id | address       | note                            | parcel_quantity | cod_amount | weight | exchange | created_at                  | updated_at                  |
      | 0         | 1            | 464         | New York City | En hizli ve güvenilir tek adres | 7               | 0.00       | 0      | 0        | 2024-09-30T11:34:43.000000Z | 2024-09-30T11:34:43.000000Z |


  Scenario: Invalid Token When a GET request with invalid authorization is sent to the api/pickuprequest/all endpoint,
  verify that the status code is 401 and the response body contains the message "Unauthenticated."

    * The api user sets "api/pickuprequest/all" path parameters.
    * The api user sends a "GET" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.
