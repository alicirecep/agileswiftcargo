Feature: As an administrator (admin) I want to be able to access the todo list via API connection.

  Scenario Outline: admin Verify that sending a GET request with valid authorization to api/todo/list returns a 200 status
  code. Additionally, confirm that the response body contains the correct details (title, description, user_id, date, status,
  note, created_at, updated_at) for the todo item with ID (x).

    * The api user sets "api/todo/list" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies the information in the response body for the entry with the specified <dataindex> index, including "<title>", "<description>", <user_id>, "<date>", <status>, "<created_at>" and "<updated_at>".

    Examples:
      | dataindex | title                                  | description     | user_id | date       | status | created_at                  | updated_at                  |
      | 0         |                                        | qweqwe          | 915     | 2024-09-19 | 2      | 2024-09-10T00:31:14.000000Z | 2024-09-12T10:23:02.000000Z |
      | 1         | pouneh.deliveryman@agileswiftcargo.com | ADD AFTER CLEAR | 3       | 2024-09-11 | 1      | 2024-09-11T07:30:36.000000Z | 2024-09-11T07:30:36.000000Z |


  Scenario: Invalid Token Verify that sending a GET request with invalid authorization to api/todo/list returns a 401
  status code and the message "Unauthenticated." in the response body.

    * The api user sets "api/todo/list" path parameters.
    * The api user sends a "GET" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.
