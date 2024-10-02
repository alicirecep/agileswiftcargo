Feature: As an administrator (admin), I want to be able to access the detailed information of the ticket with the specified id number via the API connection.

  Scenario Outline: admin Validate that when a GET request is sent to the api/ticket/{id} endpoint with valid authorization
  and the correct data (id), the response status code is 200 and the response body contains the following data: (id, user_id,
  department_id, service, priority, subject, description, date, attached_file, status, created_at, updated_at).

    * The api user sets "api/ticket/<id>" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the data in the response body includes <id>, <user_id>, <department_id>, "<service>", "<priority>", "<subject>", "<description>", "<date>", <status>, "<created_at>" and "<updated_at>".

    Examples:
      | id | id | user_id | department_id | service  | priority | subject                   | description                 | date       | status | created_at                  | updated_at                  |
      | 4  | 4  | 33      | 3             | delivery | high     | Missing Items in Shipment | complaint from our customer | 2023-09-04 | 0      | 2023-09-04T14:36:06.000000Z | 2024-09-17T12:29:12.000000Z |


  Scenario: admin Validate that when a GET request is sent to the api/ticket/{id} endpoint with valid authorization and a
  request that does not contain (id), the response status code is 203 and the response body contains the message "No id."

    * The api user sets "api/ticket" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "No id.".


  Scenario Outline: admin Validate that when a GET request is sent to the api/ticket/{id} endpoint with valid authorization
  and a request containing a non-existent (id), the response status code is 203 and the response body contains the message
  "No id or there is no ticket with this id"

    * The api user sets "api/ticket/<id>" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "No id or there is no ticket with this id".

    Examples:
      | id   |
      | 5247 |


  Scenario Outline: Invalid Token Send a GET request to the api/ticket/{id} endpoint with invalid authorization,
  verify that the response status code is 401 and the message in the response body is 'Unauthenticated.'

    * The api user sets "api/ticket/<id>" path parameters.
    * The api user sends a "GET" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.

    Examples:
      | id |
      | 4  |