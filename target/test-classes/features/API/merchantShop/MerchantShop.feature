Feature: As an administrator (admin), I want to be able to access the detailed information of the merchant shop with the specified id number via the API connection.

  Scenario Outline: admin When a valid GET request is sent to the api/merchantshop/{id} endpoint with valid authorization
  and the correct id, it must return a status code of 200. Additionally, the response body must include the data fields
  (id, merchant_id, name, contact_no, address, status, default_shop, created_at, updated_at).

    * The api user sets "api/merchantshop/<id>" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the data in the response body includes <id>, <merchant_id>, "<name>", "<contact_no>", "<address>", <status>, <default_shop>, "<created_at>" and "<updated_at>".

    Examples:
      | id  | id  | merchant_id | name    | contact_no  | address | status | default_shop | created_at                  | updated_at                  |
      | 627 | 971 | 627         | Firm AŞ | 11111111111 | Houston | 1      | 1            | 2024-09-29T20:09:02.000000Z | 2024-09-29T20:09:02.000000Z |


  Scenario: admin When a GET request is sent to the api/merchantshop/{id} endpoint with valid authorization and no id,
  it must return a status code of 203 with the message "No id."

    * The api user sets "api/merchantshop" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "No id.".


  Scenario Outline: Invalid Token When an invalid authorization is used to send a GET request to the api/merchantshop/{id}
  endpoint, it must return a status code of 401 with the message "Unauthenticated."

    * The api user sets "api/merchantshop/<id>" path parameters.
    * The api user sends a "GET" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.

    Examples:
      | id  |
      | 627 |