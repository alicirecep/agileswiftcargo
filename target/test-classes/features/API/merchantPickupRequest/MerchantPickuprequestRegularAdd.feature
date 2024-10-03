Feature: As a merchant I want to be able to add regular pickup via API connection.

  Scenario Outline: merchant When sending a POST request to the api/merchant-pickuprequest/regular/add endpoint with valid
  authorization and the correct data (note, parcel_quantity), it should return a status code of 200 and a response body
  message stating "New Regular Pickup Request Added".

    * The api user sets "api/merchant-pickuprequest/regular/add" path parameters.
    * The api user prepares a POST request containing "<note>" and <parcel_quantity> information to send to the api pickuprequestregularadd endpoint.
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "New Regular Pickup Request Added".

    Examples:
      | note          | parcel_quantity |
      | Note,note.... | 15              |


  Scenario: merchant When sending a POST request to the api/merchant-pickuprequest/regular/add endpoint with valid
  authorization and no data, it should return a status code of 400 and a response body message stating
  "Note, parcel quantity is required.".

    * The api user sets "api/merchant-pickuprequest/regular/add" path parameters.
    * The api user prepares a "POST" request that contains no data.
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 400.
    * The api user verifies that the "message" information in the response body is "Note, parcel quantity is required.".


  Scenario Outline: Invalid Token When sending a POST request to the api/merchant-pickuprequest/regular/add endpoint with
  invalid authorization and valid data (note, parcel_quantity), it should return a status code of 401 and a response body
  message stating "Unauthenticated.".

    * The api user sets "api/merchant-pickuprequest/regular/add" path parameters.
    * The api user prepares a POST request containing "<note>" and <parcel_quantity> information to send to the api pickuprequestregularadd endpoint.
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 401.
    * The api user verifies that the "message" information in the response body is "Unauthenticated.".

    Examples:
      | note          | parcel_quantity |
      | Note,note.... | 15              |

