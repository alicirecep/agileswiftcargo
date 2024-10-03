Feature: As a merchant, I want to be able to add parcel via API connection.

  Scenario Outline: merchant Verify that when a POST request is sent to the api/merchant-parcel/add endpoint with valid
  authorization and the correct data (merchant_shop_id, category_id, delivery_type_id, customer_name, customer_phone,
  customer_address), the response returns a status code of 200, and the response body contains the message "Parcel is added".

    * The api user sets "api/merchant-parcel/add" path parameters.
    * The api user prepares a POST request containing <merchant_shop_id>, <category_id>, <delivery_type_id>, "<customer_name>", "<customer_phone>" and "<customer_address>" information to send to the api expressadd endpoint.
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "Parcel is added".

    Examples:
      | merchant_shop_id | category_id | delivery_type_id | customer_name | customer_phone | customer_address                  |
      | 802              | 1           | 1                | Jane Due      | 145879632147   | 318 WARREN ST, Brooklyn, NY 11206 |


  Scenario Outline: merchant When sending a POST request to the api/merchant-parcel/add endpoint with valid authorization
  and correct data (category_id, delivery_type_id, customer_name, customer_phone, customer_address), the response should
  return a status code of 200, and the message in the response body should be "Parcel is added".

    * The api user sets "api/merchant-parcel/add" path parameters.
    * The api user prepares a POST request containing <category_id>, <delivery_type_id>, "<customer_name>", "<customer_phone>" and "<customer_address>" information to send to the api expressadd endpoint.
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "Parcel is added".

    Examples:
      | category_id | delivery_type_id | customer_name | customer_phone | customer_address                  |
      | 1           | 1                | Jane Due      | 145879632147   | 318 WARREN ST, Brooklyn, NY 11206 |


  Scenario: merchant When sending a POST request to the api/merchant-parcel/add endpoint with valid authorization but no
  data, the response should return a status code of 203, and the message in the response body should be
  "There is not enough information to add a parcel.".

    * The api user sets "api/merchant-parcel/add" path parameters.
    * The api user prepares a "POST" request that contains no data.
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "There is not enough information to add a parcel.".


  Scenario Outline: merchant When a POST request is sent to the api/merchant-parcel/add endpoint with valid authorization
  but an invalid merchant_shop_id, the response should return a status code of 203, and the message in the response body
  should be "There is no shop for this merchant.".

    * The api user sets "api/merchant-parcel/add" path parameters.
    * The api user prepares a POST request containing <merchant_shop_id>, <category_id>, <delivery_type_id>, "<customer_name>", "<customer_phone>" and "<customer_address>" information to send to the api expressadd endpoint.
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "There is no shop for this merchant.".

    Examples:
      | merchant_shop_id | category_id | delivery_type_id | customer_name | customer_phone | customer_address                  |
      | 3                | 1           | 1                | Jane Due      | 145879632147   | 318 WARREN ST, Brooklyn, NY 11206 |


  Scenario Outline: Invalid Token When a POST request is sent to the api/merchant-parcel/add endpoint with invalid
  authorization and valid data (merchant_shop_id, category_id, delivery_type_id, customer_name, customer_phone,
  customer_address), the response should return a status code of 401, and the message in the response body should
  be "Unauthenticated."

    * The api user sets "api/merchant-parcel/add" path parameters.
    * The api user prepares a POST request containing <merchant_shop_id>, <category_id>, <delivery_type_id>, "<customer_name>", "<customer_phone>" and "<customer_address>" information to send to the api expressadd endpoint.
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 401.
    * The api user verifies that the "message" information in the response body is "Unauthenticated.".

    Examples:
      | merchant_shop_id | category_id | delivery_type_id | customer_name | customer_phone | customer_address                  |
      | 802              | 1           | 1                | Jane Due      | 145879632147   | 318 WARREN ST, Brooklyn, NY 11206 |

