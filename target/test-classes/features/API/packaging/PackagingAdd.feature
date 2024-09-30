Feature: As an administrator (admin) I want to be able to create a new packaging record via API connection.

  Scenario: admin When sending a POST request to the api/packaging/add endpoint with valid authorization information and
  correct data (name, price, status, position), the status code returned should be 200, and the message in the response
  body should be "New Packaging Added". Additionally, it should be verified that the new packaging record has been created
  by sending a GET request to the api/packaging/{id} endpoint using the "new packaging ID" obtained from the response body.

    * The api user sets "api/packaging/add" path parameters.
    * The api user prepares a POST request to send to the api "packaging" add endpoint.
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "New Packaging Added".
    * The api user verifies that the "name" is "Gift Box" by sending a GET request to the "api" "packaging" endpoint with the "data" "new packaging ID" returned in the response body.


  Scenario Outline: admin When sending a POST request to the api/packaging/add endpoint with valid authorization information
  and missing data in the request body, the status code returned should be 400, and the message in the response body should
  be "Name, price, status and position required"

    * The api user sets "api/packaging/add" path parameters.
    * The api user prepares a POST request containing "<name>", <status> and "<position>" information to send to the api packagingdd endpoint.
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 400.
    * The api user verifies that the "message" information in the response body is "Name, price, status and position required".

    Examples:
      | name     | status | position |
      | Gift Box | 1      | 5        |


  Scenario: admin When sending a POST request to the api/packaging/add endpoint with valid authorization information and an
  empty request body, the status code returned should be 400, and the message in the response body should be
  "Name, price, status and position required"

    * The api user sets "api/packaging/add" path parameters.
    * The api user prepares a "POST" request that contains no data.
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 400.
    * The api user verifies that the "message" information in the response body is "Name, price, status and position required".


  Scenario: Invalid Token When sending a POST request to the api/packaging/add endpoint with invalid authorization
  information and a valid request body (including name, price, status, and position), the status code returned should be
  401, and the message in the response body should be "Unauthenticated."

    * The api user sets "api/packaging/add" path parameters.
    * The api user prepares a POST request to send to the api "packaging" add endpoint.
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 401.
    * The api user verifies that the "message" information in the response body is "Unauthenticated.".


