Feature: As an administrator (admin), I want to be able to access the last five blogs via an API connection.

  Scenario Outline: admin When sending a GET request to the api/blog/last endpoint with valid authorization, the status
  code should be 200, and the response body should return the correct details for the blog with the given ID, including
  title, image_id, description, position, status, created_by, views, created_at, and updated_at.

    * The api user sets "api/blog/last" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies the information in the response body for the entry with the specified <dataindex> index, including "<title>", "<description>", "<position>", <status>, <created_by>, "<views>", "<created_at>" and "<updated_at>".

    Examples:
      | dataindex | title      | description                            | position | status | created_by | views | created_at                  | updated_at                  |
      | 0         | Blog 55222 | The rapid and huge growth life market. | 8        | 1      | 930        | 0     | 2024-10-01T09:39:28.000000Z | 2024-10-01T09:39:28.000000Z |


  Scenario: Invalid Token When sending a GET request to the api/blog/last endpoint with invalid authorization,
  the status code should be 401, and the response body should contain the message "Unauthenticated.".

    * The api user sets "api/blog/last" path parameters.
    * The api user sends a "GET" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.
