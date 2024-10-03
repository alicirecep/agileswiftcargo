Feature: As a merchant, I want to be able to add tickets via API connection.

  Scenario Outline: merchant Verify that when a POST request is sent to the api/merchant-ticket/add endpoint with valid
  authorization and correct data (subject, description, priority), the response returns a status code of 200 and the
  response body contains the message "New Support Ticket Added".

    * The api user sets "api/merchant-ticket/add" path parameters.
    * The api user prepares a POST request containing "<subject>", "<description>" and "<priority>" information to send to the api ticketadd endpoint.
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "New Support Ticket Added".

    Examples:
      | subject   | description      | priority |
      | ticket121 | Problem delivery | medium   |


  Scenario Outline: merchant Verify that when a POST request is sent to the api/merchant-ticket/add endpoint with valid
  authorization and incomplete data (missing priority) in the request body (subject, description), the response returns
  a status code of 203 and the response body contains the message "Subject, priority and description is required.".

    * The api user sets "api/merchant-ticket/add" path parameters.
    * The api user prepares a POST request containing "<subject>" and "<description>" information to send to the api ticketadd endpoint.
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "Subject, priority and description is required.".

    Examples:
      | subject   | description      |
      | ticket121 | Problem delivery |


  Scenario: merchant Verify that when a POST request is sent to the api/merchant-ticket/add endpoint with valid authorization
  and no data in the request body, the response returns a status code of 203 and the response body contains the message
  "Subject, priority and description is required.".

    * The api user sets "api/merchant-ticket/add" path parameters.
    * The api user prepares a "POST" request that contains no data.
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "Subject, priority and description is required.".


  Scenario Outline: Invalid Token Verify that when a POST request is sent to the api/merchant-ticket/add endpoint with
  invalid authorization and valid data (subject, description, priority) in the request body, the response returns a
  status code of 401 and the response body contains the message "Unauthenticated.".

    * The api user sets "api/merchant-ticket/add" path parameters.
    * The api user prepares a POST request containing "<subject>", "<description>" and "<priority>" information to send to the api ticketadd endpoint.
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 401.
    * The api user verifies that the "message" information in the response body is "Unauthenticated.".

    Examples:
      | subject   | description      | priority |
      | ticket121 | Problem delivery | medium   |
