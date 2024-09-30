Feature: As an administrator (admin), I want to be able to access the detailed information of the packaging with the specified id number via the API connection.

  Scenario Outline: admin When a GET request is sent to the api/packaging/{id} endpoint with valid authorization and the
  correct data (id), verify that the status code is 200 and the response body contains the following data: (id, name,
  price, status, position, photo, created_at, updated_at).

    * The api user sets "api/packaging/<id>" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the data in the response body includes <id>, "<name>", "<price>", <status>, "<position>", "<created_at>" and "<updated_at>".

    Examples:
      | id | id | name                 | price | status | position | created_at                  | updated_at                  |
      | 8  | 8  | Gift Box with flower | 75.00 | 1      | 4        | 2024-09-19T10:26:08.000000Z | 2024-09-19T10:26:08.000000Z |


  Scenario: admin When a GET request is sent to the api/packaging/{id} endpoint without the (id) parameter but with valid
  authorization, verify that the status code is 203 and the response body contains the message "No id."

    * The api user sets "api/packaging" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "No id.".


  Scenario Outline: admin When a GET request is sent to the api/packaging/{id} endpoint with valid authorization and a
  non-existent (id) parameter, verify that the status code is 203 and the response body contains the message
  "there is no packaging with this id"

    * The api user sets "api/packaging/<id>" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "there is no packaging with this id".

    Examples:
      | id   |
      | 7512 |

  Scenario Outline: Invalid Token Send a GET request to the api/packaging/{id} endpoint with invalid authorization,
  verify that the response status code is 401 and the message in the response body is 'Unauthenticated.'

    * The api user sets "api/packaging/<id>" path parameters.
    * The api user sends a "GET" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.

    Examples:
      | id |
      | 8  |

