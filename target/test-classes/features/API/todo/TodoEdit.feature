Feature: As an administrator (admin), I want to be able to update todo information with the specified id number via API connection.

  @Patch
  Scenario Outline: admin TODO Verify that sending a PATCH request with valid authorization and correct data to
  api/todo/edit/{id} returns a 200 status code and the message "Updated" and that the ID in the response body
  matches the ID in the request path. Confirm that the ToDo record has been updated via a GET request to api/todo/{id}.

    * The api user sets "api/todo/edit" path parameters.
    * The api user prepares a PATCH request containing "<title>", "<description>", <user_id> and "<date>" information to send to the api ticketedit endpoint.
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "Updated".
    * The api user verifies that the "data" "id" information in the returned response body is the same as the id path parameter written in the endpoint.
    * The api user verifies that the "title" is "Updated Task" by sending a GET request to the "api" "todo" endpoint with the "data" "id" returned in the response body.

    Examples:
      | title        | description | user_id | date       |
      | Updated Task | Task New    | 983     | 2023-08-28 |


  @Patch
  Scenario: admin TODO Verify that sending a PATCH request with valid authorization, a valid ID, but no data to
  api/todo/edit/{id} returns a 400 status code and the message "No id or There is no data to update."

    * The api user sets "api/todo/edit" path parameters.
    * The api user prepares a "PATCH" request that contains no data.
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "No id or There is no data to update.".


  Scenario Outline: admin Verify that sending a PATCH request with valid authorization, containing a body
  (title, description, user_id, date) but without an ID to api/todo/edit/{id} returns a 203 status code and the
  message "No id."

    * The api user sets "api/todo/edit" path parameters.
    * The api user prepares a PATCH request containing "<title>", "<description>", <user_id> and "<date>" information to send to the api ticketedit endpoint.
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "No id.".

    Examples:
      | title        | description | user_id | date       |
      | Updated Task | Task New    | 983     | 2023-08-28 |


  Scenario Outline: admin Verify that sending a PATCH request with valid authorization and a non-existent (id) in the body
  (title, description, user_id, date) to the api/todo/edit/{id} endpoint returns a 203 status code and the message
  "There is no ToDo with this id"

    * The api user sets "api/todo/edit/9856" path parameters.
    * The api user prepares a PATCH request containing "<title>", "<description>", <user_id> and "<date>" information to send to the api ticketedit endpoint.
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "There is no ToDo with this id".

    Examples:
      | title        | description | user_id | date       |
      | Updated Task | Task New    | 983     | 2023-08-28 |


  @Patch
  Scenario Outline: Invalid Token TODO Verify that sending a PATCH request with invalid authorization and a body (title, description,
  user_id, date) to the api/todo/edit/{id} endpoint returns a 401 status code and the message "Unauthenticated."

    * The api user sets "api/todo/edit" path parameters.
    * The api user prepares a PATCH request containing "<title>", "<description>", <user_id> and "<date>" information to send to the api ticketedit endpoint.
    * The api user sends a "PATCH" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.

    Examples:
      | title        | description | user_id | date       |
      | Updated Task | Task New    | 983     | 2023-08-28 |

