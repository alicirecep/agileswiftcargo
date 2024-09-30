Feature: As an administrator (admin), I want to be able to update the express pickup information with the specified id number via API connection.

  @Patch
  Scenario Outline: admin EXPRESS When a PATCH request is sent to the api/pickuprequest/express/edit/{id} endpoint with
  valid authorization, the correct (id), and a body containing valid data (address, note, name), verify that the status
  code is 200 and the response body contains the message "Updated." Additionally, confirm that the "Updated Request ID"
  from the response body matches the (id) path parameter in the request. Finally, validate that the express pickup record
  has been successfully updated by sending a GET request to the api/pickuprequest/{id} endpoint.

    * The api user sets "api/pickuprequest/express/edit" path parameters.
    * The api user prepares a PATCH request containing "<address>", "<note>" and "<name>" information to send to the api expressedit endpoint.
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "Updated".
    * The api user verifies that the "data" "Updated Request  ID" information in the returned response body is the same as the id path parameter written in the endpoint.
    * The api user verifies that the "address" is "Arizona" by sending a GET request to the "api" "pickuprequest" endpoint with the "data" "Updated Request  ID" returned in the response body.

    Examples:
      | address | note            | name            |
      | Arizona | Updated request | Express Request |

  @Patch
  Scenario: admin EXPRESS When a PATCH request is sent to the api/pickuprequest/express/edit/{id} endpoint with valid
  authorization, the correct (id), and an empty body (no data), verify that the status code is 400 and the response body
  contains the message "There is no data to update."

    * The api user sets "api/pickuprequest/express/edit" path parameters.
    * The api user prepares a "PATCH" request that contains no data.
    * The api user sends a "PATCH" request, saves the returned response, and verifies that the status code is '400' with the reason phrase Bad Request.


  Scenario Outline: admin When a PATCH request is sent to the api/pickuprequest/express/edit/{id} endpoint with valid
  authorization and a body that does not include the (id) (with fields address, note, and name), verify that the
  status code is 203 and the response body contains the message "No request id."

    * The api user sets "api/pickuprequest/express/edit" path parameters.
    * The api user prepares a PATCH request containing "<address>", "<note>" and "<name>" information to send to the api expressedit endpoint.
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "No request id.".

    Examples:
      | address | note            | name            |
      | Arizona | Updated request | Express Request |


  Scenario Outline: admin When a PATCH request is sent to the api/pickuprequest/express/edit/{id} endpoint with valid
  authorization and a body containing a non-existent (id) (with fields address, note, and name), verify that the status
  code is 203 and the response body contains the message "No pickup request with this id."

    * The api user sets "api/pickuprequest/express/edit/1254" path parameters.
    * The api user prepares a PATCH request containing "<address>", "<note>" and "<name>" information to send to the api expressedit endpoint.
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "No pickup request with this id.".

    Examples:
      | address | note            | name            |
      | Arizona | Updated request | Express Request |

  @Patch
  Scenario Outline: Invalid Token EXPRESS When a PATCH request is sent to the api/pickuprequest/express/edit/{id} endpoint with
  invalid authorization and a body containing (address, note, name), verify that the status code is 401 and the response
  body contains the message "Unauthenticated."

    * The api user sets "api/pickuprequest/express/edit" path parameters.
    * The api user prepares a PATCH request containing "<address>", "<note>" and "<name>" information to send to the api expressedit endpoint.
    * The api user sends a "PATCH" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.

    Examples:
      | address | note            | name            |
      | Arizona | Updated request | Express Request |

