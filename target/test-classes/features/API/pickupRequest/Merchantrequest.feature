Feature: As an administrator (admin), I want to be able to access the detailed information of the pickup with the specified merchant_id number via the API connection.

  Scenario Outline: admin When a GET request with valid authorization and correct data (merchant_id) is sent to the
  api/merchantrequest/{id} endpoint, verify that the status code is 200. Also, confirm that the response body for id(x)
  contains the correct data for fields: request_type, merchant_id, address, note, parcel_quantity, name, phone, cod_amount,
  invoice, weight, exchange, created_at, and updated_at.

    * The api user sets "api/merchantrequest/<id>" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies the information in the response body for the entry with the specified <dataindex> index, including "<request_type>", <merchant_id>, "<address>", "<note>", <parcel_quantity>, "<name>", "<phone>", "<cod_amount>", "<invoice>", <weight>, <exchange>, "<created_at>" and "<updated_at>".

    Examples:
      | id  | dataindex | request_type | merchant_id | address      | note | parcel_quantity | name      | phone      | cod_amount | invoice | weight | exchange | created_at                  | updated_at                  |
      | 461 | 0         | 2            | 461         | 123 New York |      | 0               | Emrh Test | 1231231234 | 1.00       | 1       | 1      | 0        | 2024-09-11T15:45:30.000000Z | 2024-09-11T15:45:30.000000Z |


  Scenario: admin When a GET request with valid authorization but missing merchant_id is sent to the api/merchantrequest/{id}
  endpoint, verify that the status code is 203 and the response body contains the message "No id."

    * The api user sets "api/merchantrequest" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "No id.".


  Scenario Outline: Invalid Token When a GET request with invalid authorization is sent to the api/merchantrequest/{id}
  endpoint, verify that the status code is 401 and the response body contains the message "Unauthenticated."

    * The api user sets "api/merchantrequest/<id>" path parameters.
    * The api user sends a "GET" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.

    Examples:
      | id  |
      | 461 |

