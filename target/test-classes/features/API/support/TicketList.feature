Feature: As an administrator (admin) I want to be able to access Ticket List via API connection.

  Scenario Outline: admin Validate that when a GET request is sent to the api/ticket/list endpoint with valid authorization,
  the response status code is 200 and the response body for ticket with id(x) includes the following fields: user_id,
  department_id, service, priority, subject, description, date, attached_file, status, created_at, updated_at.

    * The api user sets "api/ticket/list" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies the information in the response body for the entry with the specified <dataindex> index, including <user_id>, <department_id>, "<service>", "<priority>", "<subject>", "<description>", "<date>", <status>, "<created_at>" and "<updated_at>".

    Examples:
      | dataindex | user_id | department_id | service  | priority | subject                   | description                 | date       | status | created_at                  | updated_at                  |
      | 0         | 33      | 3             | delivery | high     | Missing Items in Shipment | complaint from our customer | 2023-09-04 | 0      | 2023-09-04T14:36:06.000000Z | 2024-09-17T12:29:12.000000Z |


  Scenario: Invalid Token Validate that when a GET request is sent to the api/ticket/list endpoint with invalid
  authorization, the response status code is 401 and the response body contains the message "Unauthenticated.".

    * The api user sets "api/ticket/list" path parameters.
    * The api user sends a "GET" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.

