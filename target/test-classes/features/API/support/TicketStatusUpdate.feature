Feature: As an administrator (admin), I want to be able to update the status of the ticket with the specified id number via the API connection.

  @Patch
  Scenario Outline: admin TICKET Verify that a GET request with valid authorization and correct status data to
  api/ticket/status-update/{id} returns a 200 status code, a response message "Status Updated", and that
  the response body ID matches the path parameter ID.

    * The api user sets "api/ticket/status-update" path parameters.
    * The api user prepares a GET request containing <status> information to send to the api ticketedit endpoint.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "Status Updated".
    * The api user verifies that the "data" "ID" information in the returned response body is the same as the id path parameter written in the endpoint.

    Examples:
      | status |
      | 3      |


  Scenario Outline: admin Verify that sending a GET request with valid authorization but without an ID in the body to
  api/ticket/status-update/{id} returns a 203 status code and the message "No id or there is no ticket with this id"
  in the response body.

    * The api user sets "api/ticket/status-update" path parameters.
    * The api user prepares a GET request containing <status> information to send to the api ticketedit endpoint.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "No id or there is no ticket with this id".

    Examples:
      | status |
      | 3      |


  Scenario Outline: admin Verify that sending a GET request with valid authorization and a non-existent ID to
  api/ticket/status-update/{id} returns a 203 status code and the message "No id or there is no ticket with this id"
  in the response body.

    * The api user sets "api/ticket/status-update/9624" path parameters.
    * The api user prepares a GET request containing <status> information to send to the api ticketedit endpoint.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "No id or there is no ticket with this id".

    Examples:
      | status |
      | 3      |


  @Patch
  Scenario Outline: Invalid Token TICKET Verify that sending a GET request with invalid authorization to
  api/ticket/status-update/{id} returns a 401 status code and the message "Unauthenticated." in the response body.

    * The api user sets "api/ticket/status-update" path parameters.
    * The api user prepares a GET request containing <status> information to send to the api ticketedit endpoint.
    * The api user sends a "GET" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.

    Examples:
      | status |
      | 3      |


  Scenario Outline: admin Verify that the ticket status is updated by sending a GET request to api/ticket/{id} using the
  "ID" from the response body of the status update request.

    * The api user sets "api/ticket/<id>" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that status is 3.

    Examples:
      | id  |
      | 703 |

