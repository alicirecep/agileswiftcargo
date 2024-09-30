Feature: As an administrator (admin), I want to be able to update the packaging information with the specified id number via API connection.

  @Patch
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

  @Patch
  Scenario: admin PACKAGING When sending a PATCH request to the api/packaging/edit/{id} endpoint with valid authorization
  and a valid (id) but no data in the request body, the status code returned should be 400, and the response body should
  contain the message "There is no data to update."

    * The api user sets "api/packaging/edit" path parameters.
    * The api user prepares a "PATCH" request that contains no data.
    * The api user sends a "PATCH" request, saves the returned response, and verifies that the status code is '400' with the reason phrase Bad Request.


  Scenario Outline: admin When sending a PATCH request to the api/packaging/edit/{id} endpoint with valid authorization and
  a request body containing (name, price) but no (id), the status code returned should be 203, and the response body should
  contain the message "No id."

    * The api user sets "api/packaging/edit" path parameters.
    * The api user prepares a PATCH request containing "<name>" and "<price>" information to send to the api packagingedit endpoint.
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "No id.".

    Examples:
      | name                 | price |
      | Gift Box with flower | 75.00 |


  Scenario Outline: admin When sending a PATCH request to the api/packaging/edit/{id} endpoint with valid authorization
  and a request body containing (name, price) for a non-existent (id), the status code returned should be 203, and the
  response body should contain the message "no id or there is no packaging with this id."

    * The api user sets "api/packaging/edit/2654" path parameters.
    * The api user prepares a PATCH request containing "<name>" and "<price>" information to send to the api packagingedit endpoint.
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "no id or there is no packaging with this id.".

    Examples:
      | name                 | price |
      | Gift Box with flower | 75.00 |

  @Patch
  Scenario Outline: Invalid Token PACKAGING When sending a PATCH request to the api/packaging/edit/{id} endpoint with invalid
  authorization and a request body containing (name, price), the status code returned should be 401, and the response
  body should contain the message "Unauthenticated."

    * The api user sets "api/packaging/edit" path parameters.
    * The api user prepares a PATCH request containing "<name>" and "<price>" information to send to the api packagingedit endpoint.
    * The api user sends a "PATCH" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.

    Examples:
      | name                 | price |
      | Gift Box with flower | 75.00 |
