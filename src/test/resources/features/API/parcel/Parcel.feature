Feature: As an administrator (admin), I want to be able to access the detailed information of the parcel with the specified id number via the API connection.

  Scenario Outline: admin Send a GET request to the api/parcel/{id} endpoint with valid authorization and correct id,
  verify that the response status code is 200, success is true, and confirm the details (id, merchant_id, merchant_shop_id,
  pickup_address, pickup_phone, customer_name, customer_phone, customer_address, invoice_no, category_id, weight,
  delivery_type_id, packaging_id, first_hub_id, hub_id, transfer_hub_id, cash_collection).

    * The api user sets "api/parcel/<id>" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "success" information in the response body is true.
    * The api user verifies that the data in the response body includes <id>, <merchant_id>, <merchant_shop_id>, "<pickup_address>", "<pickup_phone>", "<customer_name>", "<customer_phone>", "<customer_address>", "<invoice_no>", <category_id>, <weight>, <delivery_type_id>, <first_hub_id>, <hub_id>, <transfer_hub_id> and "<cash_collection>".

    Examples:
      | id | id | merchant_id | merchant_shop_id | pickup_address | pickup_phone  | customer_name | customer_phone | customer_address | invoice_no | category_id | weight | delivery_type_id | first_hub_id | hub_id | transfer_hub_id | cash_collection |
      | 39 | 39 | 2           | 6                | Los Angeles    | 1234567891011 | gwen          | 55555555550    | san diego        |            | 1           | 1      | 1                | 2            | 11     | 11              | 5.00            |


  Scenario: admin Send a GET request to the api/parcel/{id} endpoint with valid authorization but without an id,
  verify that the response status code is 203 and the message in the response body is 'No id.'

    * The api user sets "api/parcel" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "No id.".


  Scenario Outline: admin Send a GET request to the api/parcel/{id} endpoint with valid authorization and a non-existent id,
  verify that the response status code is 203 and the message in the response body is 'there is no parcel with this id'

    * The api user sets "api/parcel/<id>" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "there is no parcel with this id".

    Examples:
      | id   |
      | 5214 |


  Scenario Outline: Invalid Token Send a GET request to the api/parcel/{id} endpoint with invalid authorization,
  verify that the response status code is 401 and the message in the response body is 'Unauthenticated.'

    * The api user sets "api/parcel/<id>" path parameters.
    * The api user sends a "GET" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.

    Examples:
      | id |
      | 39 |