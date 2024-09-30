Feature: As an administrator (admin) I want to be able to create a new regular pickup record via API connection.

  Scenario: admin When a POST request containing valid authorization and the correct data (merchant_id, note,
  parcel_quantity) is sent to the api/pickuprequest/regular/add endpoint, verify that the status code is 200 and the
  response body contains the message "Pickup Request Added". Additionally, confirm that the new regular pickup request
  is created by sending a GET request to the api/pickuprequest/{id} endpoint using the "New Pickup Request ID" from
  the response body.

    * The api user sets "api/pickuprequest/regular/add" path parameters.
    * The api user prepares a POST request to send to the api "regular" add endpoint.
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "Pickup Request Added".
    * The api user verifies that the "note" is "Note...." by sending a GET request to the "api" "pickuprequest" endpoint with the "data" "New Pickup Request  ID" returned in the response body.


  Scenario Outline: admin When a POST request containing valid authorization and missing data (merchant_id) is sent to
  the api/pickuprequest/regular/add endpoint with the body (note, parcel_quantity), verify that the status code is
  400 and the response body contains the message "No merchant id.".

    * The api user sets "api/pickuprequest/regular/add" path parameters.
    * The api user prepares a POST request containing "<note>" and <parcel_quantity> information to send to the api regularadd endpoint.
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 400.
    * The api user verifies that the "message" information in the response body is "No merchant id.".

    Examples:
      | note     | parcel_quantity |
      | Note.... | 5               |


  Scenario Outline: admin When a POST request with valid authorization and an invalid merchant_id is sent to the
  api/pickuprequest/regular/add endpoint with the body (merchant_id, note, parcel_quantity), verify that the status
  code is 400 and the response body contains the message "there is no merchant with this id.".

    * The api user sets "api/pickuprequest/regular/add" path parameters.
    * The api user prepares a POST request containing <merchant_id>, "<note>" and <parcel_quantity> information to send to the api regularadd endpoint.
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 400.
    * The api user verifies that the "message" information in the response body is "there is no merchant with this id.".

    Examples:
      | merchant_id | note     | parcel_quantity |
      | 150         | Note.... | 5               |


  Scenario: Invalid Token When a POST request with invalid authorization is sent to the api/pickuprequest/regular/add
  endpoint with the correct data (merchant_id, note, parcel_quantity) in the body, verify that the status code is 401
  and the response body contains the message "Unauthenticated."

    * The api user sets "api/pickuprequest/regular/add" path parameters.
    * The api user prepares a POST request to send to the api "regular" add endpoint.
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 401.
    * The api user verifies that the "message" information in the response body is "Unauthenticated.".
