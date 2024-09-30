Feature: As an administrator (admin), I want to be able to update the packaging information with the specified id number via API connection.

  @Patch @US
  Scenario Outline: admin PACKAGING When sending a PATCH request to the api/packaging/edit/{id} endpoint with valid
  authorization, a valid (id), and a valid request body (including name and price), the status code returned should
  be 200, and the response body should indicate "Updated". Additionally, the id in the response body should match the
  id in the path parameter, confirming that the packaging record has been updated, which can be verified by sending a
  GET request to the api/packaging/{id} endpoint.

    * The api user sets "api/packaging/edit" path parameters.
    * The api user prepares a PATCH request containing "<name>" and "<price>" information to send to the api packagingedit endpoint.
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "Updated".
    * The api user verifies that the "data" "id" information in the returned response body is the same as the id path parameter written in the endpoint.
    * The api user verifies that the "name" is "Gift Box with flower" by sending a GET request to the "api" "packaging" endpoint with the "data" "id" returned in the response body.

    Examples:
      | name                 | price |
      | Gift Box with flower | 75.00 |


    Scenario: admin When sending a PATCH request to the api/packaging/edit/{id} endpoint with valid authorization and a valid (id) but no data in the request body, the status code returned should be 400, and the response body should contain the message "There is no data to update."

