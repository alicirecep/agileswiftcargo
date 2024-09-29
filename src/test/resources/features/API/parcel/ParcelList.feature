Feature: As an administrator (admin) I want to be able to access the parcel list via API connection.

  Scenario Outline: admin Send a GET request to the api/parcel/list endpoint with valid authorization, verify
  that the response status code is 200, the message is 'Success', and confirm the details (merchant_id,
  merchant_shop_id, pickup_address, pickup_phone, customer_name, customer_phone, customer_address,
  invoice_no, category_id, weight, delivery_type_id, packaging_id, first_hub_id, hub_id, transfer_hub_id,
  cash_collection) for parcel with id(x).

    * The api user sets "api/parcel/list" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "Success".
    * The api user verifies the information in the response body for the entry with the specified <dataindex> index, including <merchant_id>, <merchant_shop_id>, "<pickup_address>", "<pickup_phone>", "<customer_name>", "<customer_phone>", "<customer_address>", "<invoice_no>", <category_id>, <weight>, <delivery_type_id>, <first_hub_id>, <hub_id>, <transfer_hub_id> and "<cash_collection>".

    Examples:
      | dataindex | merchant_id | merchant_shop_id | pickup_address | pickup_phone  | customer_name | customer_phone | customer_address | invoice_no | category_id | weight | delivery_type_id | first_hub_id | hub_id | transfer_hub_id | cash_collection |
      | 0         | 2           | 6                | Los Angeles    | 1234567891011 | gwen          | 55555555550    | san diego        |            | 1           | 1      | 1                | 2            | 11     | 11              | 5.00            |


  Scenario: Invalid Token Send a GET request to the api/parcel/list endpoint with invalid authorization, verify that the
  response status code is 401 and the message in the response body is 'Unauthenticated.'

    * The api user sets "api/parcel/list" path parameters.
    * The api user sends a "GET" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.

