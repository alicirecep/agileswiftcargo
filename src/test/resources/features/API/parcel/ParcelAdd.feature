Feature: As an administrator (admin) I want to create a parcel record via API connection.

  Scenario: admin Send a POST request to the api/parcel/add endpoint with valid authorization and correct data,
  verify the response status code is 200, and the message is 'Parcel is added' Confirm the new parcel is created
  by sending a GET request to api/parcel/{id} using the 'Parcel ID' from the response.

    * The api user sets "api/parcel/add" path parameters.
    * The api user prepares a POST request to send to the api "parcel" add endpoint.
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "Parcel is added".
    * The api user verifies that the "data.customer_name" is "John Due" by sending a GET request to the "api" "parcel" endpoint with the "data" "Parcel ID" returned in the response body.


  Scenario Outline: admin Send a POST request to the api/parcel/add endpoint with valid authorization and missing data (merchant_id), verify the response status code is 400, and the message is
  'No merchant id.'

    * The api user sets "api/parcel/add" path parameters.
    * The api user prepares a POST request containing <merchant_shop_id>, <category_id>, <delivery_type_id>, "<customer_name>", "<customer_phone>" and "<customer_address>" information to send to the api hubadd endpoint.
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 400.
    * The api user verifies that the "message" information in the response body is "No merchant id.".

    Examples:
      | merchant_shop_id | category_id | delivery_type_id | customer_name | customer_phone | customer_address                  |
      | 6                | 1           | 1                | John Due      | 145879632147   | 318 WARREN ST, Brooklyn, NY 11206 |


  Scenario: Inavlid Token Send a POST request to the api/parcel/add endpoint with invalid authorization and correct data,
  verify the response status code is 401, and the message is 'Unauthenticated.'

    * The api user sets "api/parcel/add" path parameters.
    * The api user prepares a POST request to send to the api "parcel" add endpoint.
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 401.
    * The api user verifies that the "message" information in the response body is "Unauthenticated.".


