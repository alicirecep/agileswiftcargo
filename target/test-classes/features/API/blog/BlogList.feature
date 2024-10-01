Feature: As an administrator (admin), I want to be able to access the entire blog list via API connection.

  Scenario Outline: admin When sending a GET request to the api/blog/list endpoint with valid authorization, the status
  code should be 200, and the response body for the blog with id(x) should include the fields title, image_id, description,
  position, status, created_by, views, created_at, updated_at.

    * The api user sets "api/blog/list" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies the information in the response body for the entry with the specified <dataindex> index, including "<title>", <image_id>, "<description>", "<position>", <status>, <created_by>, "<views>", "<created_at>" and "<updated_at>".

    Examples:
      | dataindex | title          | image_id | description   | position | status | created_by | views | created_at                  | updated_at                  |
      | 0         | Transportation | 35       | Ensuring      | 0        | 1      | 1          | 413   | 2023-08-01T14:12:21.000000Z | 2024-09-23T14:07:05.000000Z |
      | 1         | Points         | 36       | International | 1        | 1      | 1          | 204   | 2023-08-01T14:12:21.000000Z | 2024-09-20T08:05:44.000000Z |


  Scenario: Invalid Token  When sending a GET request to the api/blog/list endpoint with invalid authorization, the status code
  should be 401, and the response body should contain the message "Unauthenticated."

    * The api user sets "api/blog/list" path parameters.
    * The api user sends a "GET" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.
