Feature: As a merchant, I want to be able to access the merchant parcel list via API connection.

  Scenario Outline: merchant Verify that when a GET request is sent to the api/merchant-parcel/list endpoint with
  valid authorization, the response returns a status code of 200. Additionally, confirm that the details for the
  specific ID (x) in the response body include (merchant_id, merchant_shop_id, pickup_address, pickup_phone, customer_name,
  customer_phone, customer_address, invoice_no, category_id, weight, delivery_type_id).

    * The api user sets "api/merchant-parcel/list" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies the information in the response body for the entry with the specified <dataindex> index, including <merchant_id>, <merchant_shop_id>, "<customer_name>", "<customer_phone>", "<customer_address>", <category_id>, <weight> and <delivery_type_id>.

    Examples:
      | dataindex | merchant_id | merchant_shop_id | customer_name        | customer_phone | customer_address       | category_id | weight | delivery_type_id |
      | 0         | 480         | 774              | Azar Gozalli Updated | 0514357043     | Yasamal, Baku, Updated | 1           | 0      | 1                |


  Scenario: Invalid Token Verify that when a GET request is sent to the api/merchant-parcel/list endpoint with invalid
  authorization, the response returns a status code of 401, and the response body contains the message "Unauthenticated."

    * The api user sets "api/merchant-parcel/list" path parameters.
    * The api user sends a "GET" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.

