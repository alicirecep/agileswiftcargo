Feature: As a merchant, I want to be able to add a shop via API connection.

  Scenario Outline: merchant Verify that when a POST request is sent to the api/merchant-shop/add endpoint with valid
  authorization and correct data (name, contact_no, address, status), the response returns a status code of 200 and the
  response body contains the message "New Shop Added".

    * The api user sets "api/merchant-shop/add" path parameters.
    * The api user prepares a POST request containing "<name>", "<contact_no>", "<address>" and <status> information to send to the api expressadd endpoint.
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "New Shop Added".

    Examples:
      | name     | contact_no | address | status |
      | XYZ SHOP | 1111111111 | Atlanta | 1      |


  Scenario Outline: merchant Verify that when a POST request is sent to the api/merchant-shop/add endpoint with valid
  authorization and missing data (name, contact_no) in the body (only providing address and status), the response
  returns a status code of 400 and the response body contains the message "There is not enough information to add a shop.".

    * The api user sets "api/merchant-shop/add" path parameters.
    * The api user prepares a POST request containing "<name>" and "<contact_no>" information to send to the api expressadd endpoint.
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 400.
    * The api user verifies that the "message" information in the response body is "There is not enough information to add a shop.".

    Examples:
      | name     | contact_no |
      | XYZ SHOP | 1111111111 |


  Scenario: merchant Verify that when a POST request is sent to the api/merchant-shop/add endpoint with valid authorization
  and an empty body, the response returns a status code of 400 and the response body contains the message
  "There is not enough information to add a shop."

    * The api user sets "api/merchant-shop/add" path parameters.
    * The api user prepares a "POST" request that contains no data.
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 400.
    * The api user verifies that the "message" information in the response body is "There is not enough information to add a shop.".


  Scenario Outline: Invalid Token Verify that when a POST request is sent to the api/merchant-shop/add endpoint with
  invalid authorization and valid data (name, contact_no, address, status), the response returns a status code of 401 and
  the response body contains the message "Unauthenticated."

    * The api user sets "api/merchant-shop/add" path parameters.
    * The api user prepares a POST request containing "<name>", "<contact_no>", "<address>" and <status> information to send to the api expressadd endpoint.
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 401.
    * The api user verifies that the "message" information in the response body is "Unauthenticated.".

    Examples:
      | name     | contact_no | address | status |
      | XYZ SHOP | 1111111111 | Atlanta | 1      |
