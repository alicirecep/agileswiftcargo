Feature: As an administrator (admin), I want to be able to access the detailed information of the blog with the specified id number via the API connection.

  Scenario Outline: admin When sending a GET request with valid authorization and correct data (id) to the api/blog/{id}
  endpoint, the status code should be 200, and the response body should be verified to contain the correct fields and values:
  id, title, image_id, description, position, status, created_by, views, created_at, updated_at.

    * The api user sets "api/blog/<id>" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the data in the response body includes <id>, "<title>", <image_id>, "<description>", "<position>", <status>, <created_by>, "<views>", "<created_at>" and "<updated_at>".

    Examples:
      | id | id | title          | image_id | description | position | status | created_by | views | created_at                  | updated_at                  |
      | 1  | 1  | Transportation | 35       | Ensuring    | 0        | 1      | 1          | 413   | 2023-08-01T14:12:21.000000Z | 2024-09-23T14:07:05.000000Z |


  Scenario: admin  When sending a GET request with valid authorization but without an (id) to the api/blog/{id} endpoint,
  the status code should be 203, and the response body should contain the message "No id.".

    * The api user sets "api/blog" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "No id.".


  Scenario Outline: admin When sending a GET request with valid authorization and a non-existent (id) to the api/blog/{id}
  endpoint, the status code should be 203, and the response body should contain the message "there is no blog with this id".

    * The api user sets "api/blog/<id>" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "there is no blog with this id".

    Examples:
      | id   |
      | 5236 |


  Scenario Outline: Invalid Token When sending a GET request with invalid authorization to the api/blog/{id} endpoint,
  the status code should be 401, and the response body should contain the message "Unauthenticated.".

    * The api user sets "api/blog/<id>" path parameters.
    * The api user sends a "GET" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.

    Examples:
      | id |
      | 1  |