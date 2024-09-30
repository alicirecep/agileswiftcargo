Feature: As an administrator (admin) I want to be able to access the Packaging List via API connection.

  Scenario Outline: admin When a GET request is sent to the api/packaging/list endpoint with valid authorization, verify
  that the status code is 200 and the response body contains the message "Success." Additionally, ensure that the response
  body includes the details of the packaging item with ID (x), specifically the fields (name, price, status, position, photo,
  created_at, updated_at).

    * The api user sets "api/packaging/list" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "Success".
    * The api user verifies the information in the response body for the entry with the specified <dataindex> index, including "<name>", "<price>", <status>, "<position>", "<created_at>" and "<updated_at>".

    Examples:
      | dataindex | name        | price | status | position | created_at                  | updated_at                  |
      | 0         | Bubble Poly | 20.00 | 1      | 2        | 2023-08-01T14:12:21.000000Z | 2023-08-01T14:12:21.000000Z |


  Scenario: Invalid Token When a GET request is sent to the api/packaging/list endpoint with invalid authorization,
  verify that the status code is 401 and the response body contains the message "Unauthenticated."

    * The api user sets "api/packaging/list" path parameters.
    * The api user sends a "GET" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.
