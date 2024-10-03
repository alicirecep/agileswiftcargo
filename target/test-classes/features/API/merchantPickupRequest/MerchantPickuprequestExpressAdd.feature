Feature: As a merchant, I want to be able to add express pickup via API connection.

  Scenario Outline: merchant When sending a POST request to the api/merchant-pickuprequest/express/add endpoint with valid
  authorization and valid data (address, name, phone), it should return a status code of 200 and a response body message
  stating "New Express Pickup Request Added".

    * The api user sets "api/merchant-pickuprequest/express/add" path parameters.
    * The api user prepares a POST request containing "<address>", "<name>" and "<phone>" information to send to the api pickuprequestexpressadd endpoint.
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "New Express Pickup Request Added".

    Examples:
      | address | name                            | phone       |
      | Houston | Express Pickup Request-Merchant | 14785236987 |


  Scenario Outline: merchant When sending a POST request to the api/merchant-pickuprequest/express/add endpoint with valid
  authorization and missing data (phone) in the request body (address, name), it should return a status code of 203 and a
  response body message stating "Name, phone and address is required.".

    * The api user sets "api/merchant-pickuprequest/express/add" path parameters.
    * The api user prepares a POST request containing "<address>" and "<name>" information to send to the api pickuprequestexpressadd endpoint.
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "Name, phone and address is required.".

    Examples:
      | address | name                            |
      | Houston | Express Pickup Request-Merchant |


  Scenario: merchant When sending a POST request to the api/merchant-pickuprequest/express/add endpoint with valid
  authorization and no data in the request body, it should return a status code of 203 and a response body message
  stating "Name, phone and address is required.".

    * The api user sets "api/merchant-pickuprequest/express/add" path parameters.
    * The api user prepares a "POST" request that contains no data.
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "Name, phone and address is required.".


  Scenario Outline: Invalid Token When sending a POST request to the api/merchant-pickuprequest/express/add endpoint
  with invalid authorization and valid data (address, name, phone) in the request body, it should return a status code
  of 401 and a response body message stating "Unauthenticated."

    * The api user sets "api/merchant-pickuprequest/express/add" path parameters.
    * The api user prepares a POST request containing "<address>", "<name>" and "<phone>" information to send to the api pickuprequestexpressadd endpoint.
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 401.
    * The api user verifies that the "message" information in the response body is "Unauthenticated.".

    Examples:
      | address | name                            | phone       |
      | Houston | Express Pickup Request-Merchant | 14785236987 |

