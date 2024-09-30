Feature: As an administrator (admin), I want to be able to access the detailed information of the pickup with the specified id number via the API connection.

  Scenario Outline: admin When a GET request with valid authorization and the correct data (id) is sent to the
  api/pickuprequest/{id} endpoint, verify that the status code is 200 and that the response body contains the
  following details: id, request_type, merchant_id, address, note, parcel_quantity, name, phone, cod_amount,
  invoice, weight, exchange, created_at, and updated_at.

    * The api user sets "api/pickuprequest/<id>" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the data in the response body includes <id>, "<request_type>", <merchant_id>, "<address>", "<note>", <parcel_quantity>, "<name>", "<phone>", "<cod_amount>", "<invoice>", <weight>, <exchange>, "<created_at>" and "<updated_at>".

    Examples:
      | id | id | request_type | merchant_id | address      | note | parcel_quantity | name          | phone        | cod_amount | invoice | weight | exchange | created_at                  | updated_at                  |
      | 98 | 98 | 2            | 461         | 123 New York | not  | 0               | Emrah Sagirli | 123123123123 | 10.00      | 15      | 10     | 0        | 2024-09-11T15:54:13.000000Z | 2024-09-11T15:54:13.000000Z |


  Scenario: admin When a GET request with valid authorization and no (id) is sent to the api/pickuprequest/{id} endpoint,
  verify that the status code is 203 and the response body contains the message "No id."

    * The api user sets "api/pickuprequest" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "No id.".


  Scenario Outline: admin When a GET request with valid authorization and a non-existent (id) is sent to the
  api/pickuprequest/{id} endpoint, verify that the status code is 203 and the response body contains the message
  "there is no pickup with this id."

    * The api user sets "api/pickuprequest/<id>" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "there is no pickup with this id.".

    Examples:
      | id   |
      | 5214 |


  Scenario Outline: Invalid Token When a GET request with invalid authorization is sent to the api/pickuprequest/{id}
  endpoint, verify that the status code is 401 and the response body contains the message "Unauthenticated."

    * The api user sets "api/pickuprequest/<id>" path parameters.
    * The api user sends a "GET" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.

    Examples:
      | id |
      | 98 |
