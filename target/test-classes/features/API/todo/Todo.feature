Feature: As an administrator (admin), I want to be able to access the detailed information of the todo with the specified id number via the API connection.

  Scenario Outline: admin Verify that sending a GET request with valid authorization and the correct ID to api/todo/{id}
  returns a 200 status code. Additionally, confirm that the response body contains the correct details (id, title,
  description, user_id, date, status, note, created_at, updated_at) for the todo item with the specified ID.

    * The api user sets "api/todo/<id>" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the data in the response body includes <id>, "<title>", "<description>", <user_id>, "<date>", <status>, "<created_at>" and "<updated_at>".

    Examples:
      | id | id | title | description | user_id | date       | status | created_at                  | updated_at                  |
      | 93 | 93 |       | qweqwe      | 915     | 2024-09-19 | 2      | 2024-09-10T00:31:14.000000Z | 2024-09-12T10:23:02.000000Z |


  Scenario: admin Verify that sending a GET request with valid authorization but no ID to api/todo/{id} returns a 203
  status code and the message "No id." in the response body.

    * The api user sets "api/todo" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "No id.".


  Scenario Outline: admin Verify that sending a GET request with valid authorization and a non-existent ID to api/todo/{id}
  returns a 203 status code and the message "No id or there is no ToDo with this id" in the response body.

    * The api user sets "api/todo/<id>" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "No id or there is no ToDo with this id".

    Examples:
      | id   |
      | 5247 |


  Scenario Outline: Invalid Token Verify that sending a GET request with invalid authorization to api/todo/{id} returns a
  401 status code and the message "Unauthenticated." in the response body.

    * The api user sets "api/todo/<id>" path parameters.
    * The api user sends a "GET" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.

    Examples:
      | id |
      | 93 |
