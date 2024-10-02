Feature: As a merchant, I want to be able to add parcel via API connection.

  Scenario Outline: merchant Verify that when a POST request is sent to the api/merchant-parcel/add endpoint with valid
  authorization and the correct data (merchant_shop_id, category_id, delivery_type_id, customer_name, customer_phone,
  customer_address), the response returns a status code of 200, and the response body contains the message "Parcel is added"

    * The api user sets "api/merchant-parcel/add" path parameters.
    * The api user prepares a POST request containing <merchant_shop_id>, <category_id>, <delivery_type_id>, "<customer_name>", "<customer_phone>" and "<customer_address>" information to send to the api expressadd endpoint.
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "Parcel is added".

    Examples:
      | merchant_shop_id | category_id | delivery_type_id | customer_name | customer_phone | customer_address                  |
      | 774              | 1           | 1                | Jane Due      | 145879632147   | 318 WARREN ST, Brooklyn, NY 11206 |


