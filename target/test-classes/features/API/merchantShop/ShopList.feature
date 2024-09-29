Feature: As an administrator (admin) I want to be able to access Shop List via API connection.

  Scenario Outline: admin When a valid GET request is sent to the api/shop/list endpoint with valid authorization, it must
  return a status code of 200. Additionally, the response body must contain the details for the shop with id x, including
  merchant_id, name, contact_no, address, status, default_shop, created_at, and updated_at.

    * The api user sets "api/shop/list" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies the information in the response body for the entry with the specified <dataindex> index, including <merchant_id>, "<name>", "<contact_no>", "<address>", <status>, <default_shop>, "<created_at>" and "<updated_at>".

    Examples:
      | dataindex | merchant_id | name    | contact_no  | address | status | default_shop | created_at                  | updated_at                  |
      | 0         | 629         | Firm AŞ | 11111111111 | Houston | 1      | 1            | 2024-09-29T20:16:55.000000Z | 2024-09-29T20:16:55.000000Z |


  Scenario: Invalid Token When an invalid authorization is used to send a GET request to the api/shop/list endpoint,
  it must return a status code of 401 with the message "Unauthenticated."

    * The api user sets "api/shop/list" path parameters.
    * The api user sends a "GET" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.


