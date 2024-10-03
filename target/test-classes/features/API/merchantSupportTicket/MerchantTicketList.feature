Feature: As a merchant, I want to be able to access the merchant ticket list via API connection.

  Scenario Outline: merchant Verify that when a GET request is sent to the api/merchant-ticket/list endpoint with valid
  authorization, the response returns a status code of 200. Additionally, validate that the response body contains the
  information for the ticket with ID (x), including the fields (user_id, department_id, service, priority, subject,
  description, date, attached_file, status, created_at, updated_at).

    * The api user sets "api/merchant-ticket/list" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies the information in the response body for the entry with the specified <dataindex> index, including <user_id>, "<priority>", "<subject>", "<description>", <status>, "<created_at>" and "<updated_at>".

    Examples:
      | dataindex | user_id | priority | subject   | description      | status | created_at                  | updated_at                  |
      | 0         | 998     | medium   | ticket121 | Problem delivery | 1      | 2024-09-18T12:23:34.000000Z | 2024-09-18T12:23:34.000000Z |


  Scenario: Invalid Token Verify that when a GET request is sent to the api/merchant-ticket/list endpoint with invalid
  authorization, the response returns a status code of 401 and the response body contains the message "Unauthenticated."

    * The api user sets "api/merchant-ticket/list" path parameters.
    * The api user sends a "GET" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.

