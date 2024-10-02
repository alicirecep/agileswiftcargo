Feature: As a merchant, I want to be able to access the merchant shop list via API connection.

  Scenario Outline: merchant Verify that when a GET request is sent to the api/merchant-shop/list endpoint with valid
  authorization, the response returns a status code of 200. Additionally, verify that the response body contains the
  details for the specified ID (x), including (merchant_id, name, contact_no, address, status, default_shop, created_at,
  updated_at).

    * The api user sets "api/merchant-shop/list" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies the information in the response body for the entry with the specified <dataindex> index, including <merchant_id>, "<name>", "<contact_no>", "<address>", <status>, <default_shop>, "<created_at>" and "<updated_at>".

    Examples:
      | dataindex | merchant_id | name     | contact_no | address | status | default_shop | created_at                  | updated_at                  |
      | 2         | 480         | XYZ SHOP | 1111111111 | Atlanta | 1      | 0            | 2024-09-16T12:31:18.000000Z | 2024-09-16T12:31:18.000000Z |


  Scenario: Invalid Token Verify that when a GET request is sent to the api/merchant-shop/list endpoint with invalid
  authorization, the response returns a status code of 401, and the response body contains the message "Unauthenticated."

    * The api user sets "api/merchant-shop/list" path parameters.
    * The api user sends a "GET" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.
