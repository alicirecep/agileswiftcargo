Feature: As an administrator (admin), I want to be able to update the status information of the todo with the specified id number via the API connection.

  @Patch
  Scenario Outline: admin TODO Verify that sending a GET request with valid authorization and correct data (status) to
  api/todo/status-update/{id} returns a 200 status code with the message "Status Updated," and the ID in the response
  body matches the ID in the path parameter.

    * The api user sets "api/todo/status-update" path parameters.
    * The api user prepares a GET request containing <status> information to send to the api status update endpoint.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "Status Updated".
    * The api user verifies that the "data" "ID" information in the returned response body is the same as the id path parameter written in the endpoint.

    Examples:
      | status |
      | 3      |


  Scenario Outline: admin Verify that sending a GET request with valid authorization but without an ID in the body to
  api/todo/status-update/{id} returns a 203 status code and the message "No id or there is no ToDo with this id"

    * The api user sets "api/todo/status-update" path parameters.
    * The api user prepares a GET request containing <status> information to send to the api status update endpoint.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "No id or there is no ToDo with this id".

    Examples:
      | status |
      | 3      |


  Scenario Outline: admin Verify that sending a GET request with valid authorization and a non-existent ID in the body to
  api/todo/status-update/{id} returns a 203 status code and the message "No id or there is no ToDo with this id"

    * The api user sets "api/todo/status-update/4521" path parameters.
    * The api user prepares a GET request containing <status> information to send to the api status update endpoint.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "No id or there is no ToDo with this id".

    Examples:
      | status |
      | 3      |

  @Patch
  Scenario Outline: Invalid Token TODO Verify that sending a GET request with invalid authorization and a body (status)
  to api/todo/status-update/{id} returns a 401 status code and the message "Unauthenticated."

    * The api user sets "api/todo/status-update" path parameters.
    * The api user prepares a GET request containing <status> information to send to the api status update endpoint.
    * The api user sends a "GET" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.

    Examples:
      | status |
      | 3      |


  Scenario Outline: admin Verify that the todo status update is successfully reflected by sending a GET request to api/todo/{id}
  using the ID from the response body, confirming the record has been updated.

    * The api user sets "api/todo/<id>" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that status is 3.

    Examples:
      | id  |
      | 109 |