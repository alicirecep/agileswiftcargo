Feature: As an administrator (admin), I want to be able to update Parcel information with the specified id number via API connection.

  @Patch
  Scenario Outline: admin PARCEL When a PATCH request is sent to the api/parcel/edit/{id} endpoint with valid authorization,
  correct {id}, and valid customer data (customer_name, customer_phone, customer_address), it should return a 200
  status code with a response body message of 'Updated' The 'id' in the response body should match the {id} in
  the path, and the updated Parcel record must be verified via a GET request to api/parcel/{id} to ensure the
  changes are applied.

    * The api user sets "api/parcel/edit" path parameters.
    * The api user prepares a PATCH request containing "<customer_name>", "<customer_phone>" and "<customer_address>" information to send to the api parceledit endpoint.
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "Updated".
    * The api user verifies that the "data" "id" information in the returned response body is the same as the id path parameter written in the endpoint.
    * The api user verifies that the "data.customer_name" is "John" by sending a GET request to the "api" "parcel" endpoint with the "data" "id" returned in the response body.

    Examples:
      | customer_name | customer_phone | customer_address                  |
      | John          | 145879632147   | 318 WARREN ST, Brooklyn, NY 11206 |

  @Patch
  Scenario: admin PARCEL When a PATCH request with valid authorization and correct {id} but no data is sent to the api/parcel/edit/{id}
  endpoint, it should return a 400 status code with the response body message 'No data to update'

    * The api user sets "api/parcel/edit" path parameters.
    * The api user prepares a "PATCH" request that contains no data.
    * The api user sends a "PATCH" request, saves the returned response, and verifies that the status code is '400' with the reason phrase Bad Request.


  Scenario Outline: admin When a PATCH request with valid authorization but without an {id} in the body
  (containing customer_name, customer_phone, customer_address) is sent to the api/parcel/edit/{id} endpoint,
  it should return a 203 status code with the response body message 'No id.'

    * The api user sets "api/parcel/edit" path parameters.
    * The api user prepares a PATCH request containing "<customer_name>", "<customer_phone>" and "<customer_address>" information to send to the api parceledit endpoint.
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "No id.".

    Examples:
      | customer_name | customer_phone | customer_address                  |
      | John          | 145879632147   | 318 WARREN ST, Brooklyn, NY 11206 |


  Scenario Outline: admin When a PATCH request with valid authorization and a non-existent {id} (containing customer_name,
  customer_phone, customer_address) is sent to the api/parcel/edit/{id} endpoint, it should return a 203 status code
  with the response body message 'there is no parcel with this id'

    * The api user sets "api/parcel/edit/8521" path parameters.
    * The api user prepares a PATCH request containing "<customer_name>", "<customer_phone>" and "<customer_address>" information to send to the api parceledit endpoint.
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "there is no parcel with this id".

    Examples:
      | customer_name | customer_phone | customer_address                  |
      | John          | 145879632147   | 318 WARREN ST, Brooklyn, NY 11206 |


  @Patch
  Scenario Outline: Invalid Token PARCEL When a PATCH request with invalid authorization and a body
  (customer_name, customer_phone, customer_address) is sent to the api/parcel/edit/{id} endpoint, it should return a
  401 status code with the response body message 'Unauthenticated.'

    * The api user sets "api/parcel/edit" path parameters.
    * The api user prepares a PATCH request containing "<customer_name>", "<customer_phone>" and "<customer_address>" information to send to the api parceledit endpoint.
    * The api user sends a "PATCH" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.

    Examples:
      | customer_name | customer_phone | customer_address                  |
      | John          | 145879632147   | 318 WARREN ST, Brooklyn, NY 11206 |

