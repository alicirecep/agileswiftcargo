Feature: As an administrator (admin) I want to be able to access the parcel list via API connection.

  @us
  Scenario Outline: admin Send a GET request to the api/parcel/list endpoint with valid authorization, verify
  that the response status code is 200, the message is 'Success', and confirm the details (merchant_id,
  merchant_shop_id, pickup_address, pickup_phone, customer_name, customer_phone, customer_address,
  invoice_no, category_id, weight, delivery_type_id, packaging_id, first_hub_id, hub_id, transfer_hub_id,
  cash_collection) for parcel with id(x).

    * The api user sets "api/parcel/list" path parameters.
    # Api kullanicisi "api/parcel/list" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Success".
    # Api kullanicisi response bodydeki message bilgisinin "Success" oldugunu dogrular
    * The api user verifies the information in the response body for the entry with the specified <dataindex> index, including <merchant_id>, <merchant_shop_id>, "<pickup_address>", "<pickup_phone>", "<customer_name>", "<customer_phone>", "<customer_address>", "<invoice_no>", <category_id>, <weight>, <delivery_type_id>, <first_hub_id>, <hub_id>, <transfer_hub_id> and "<cash_collection>".

    Examples:
      | dataindex | merchant_id | merchant_shop_id | pickup_address | pickup_phone  | customer_name | customer_phone | customer_address | invoice_no | category_id | weight | delivery_type_id | first_hub_id | hub_id | transfer_hub_id | cash_collection |
      | 0         | 2           | 6                | Los Angeles    | 1234567891011 | gwen          | 55555555550    | san diego        |            | 1           | 1      | 1                | 2            | 11     | 11              | 50.00           |


