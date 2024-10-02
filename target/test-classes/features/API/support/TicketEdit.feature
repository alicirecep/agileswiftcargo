Feature: As an administrator (admin), I want to be able to update ticket information with the specified id number via API connection.

  @Patch
  Scenario Outline: admin TICKET Verify that sending a PATCH request with valid authorization, correct ID, and valid data to
  api/ticket/edit/{id} returns a 200 status code and the message "Updated". Additionally, confirm that the ID in the response
  body matches the ID in the path parameter and that the ticket is updated by sending a GET request to api/ticket/{id} using
  the returned ID.

    * The api user sets "api/ticket/edit" path parameters.
    * The api user prepares a PATCH request containing <department_id>, "<service>", "<priority>", "<subject>", "<description>" and "<date>" information to send to the api ticketedit endpoint.
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "Updated".
    * The api user verifies that the "data" "id" information in the returned response body is the same as the id path parameter written in the endpoint.
    * The api user verifies that the "subject" is "ticket3" by sending a GET request to the "api" "ticket" endpoint with the "data" "id" returned in the response body.

    Examples:
      | department_id | service | priority | subject | description           | date       |
      | 3             | finans  | low      | ticket3 | finans ticket updated | 2023-08-23 |


  @Patch
  Scenario: admin TICKET Verify that sending a PATCH request with valid authorization and a correct ID but no data to
  api/ticket/edit/{id} returns a 400 status code and the message "There is no data to update." in the response body.

    * The api user sets "api/ticket/edit" path parameters.
    * The api user prepares a "PATCH" request that contains no data.
    * The api user sends a "PATCH" request, saves the returned response, and verifies that the status code is '400' with the reason phrase Bad Request.


  Scenario Outline: admin Verify that sending a PATCH request with valid authorization and a body missing the ID to
  api/ticket/edit/{id} returns a 203 status code and the message "No  id." in the response body.

    * The api user sets "api/ticket/edit" path parameters.
    * The api user prepares a PATCH request containing <department_id>, "<service>", "<priority>", "<subject>", "<description>" and "<date>" information to send to the api ticketedit endpoint.
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "No  id.".

    Examples:
      | department_id | service | priority | subject | description           | date       |
      | 3             | finans  | low      | ticket3 | finans ticket updated | 2023-08-23 |


  Scenario Outline: admin Verify that sending a PATCH request with valid authorization and a non-existent ID in the body
  to api/ticket/edit/{id} returns a 203 status code and the message "No id or there is no ticket with this id" in the
  response body.

    * The api user sets "api/ticket/edit/1254" path parameters.
    * The api user prepares a PATCH request containing <department_id>, "<service>", "<priority>", "<subject>", "<description>" and "<date>" information to send to the api ticketedit endpoint.
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "No id or there is no ticket with this id".

    Examples:
      | department_id | service | priority | subject | description           | date       |
      | 3             | finans  | low      | ticket3 | finans ticket updated | 2023-08-23 |


  @Patch
  Scenario Outline: Invalid Token TICKET Verify that sending a PATCH request with invalid authorization and correct data to
  api/ticket/edit/{id} returns a 401 status code and the message "Unauthenticated." in the response body.

    * The api user sets "api/ticket/edit" path parameters.
    * The api user prepares a PATCH request containing <department_id>, "<service>", "<priority>", "<subject>", "<description>" and "<date>" information to send to the api ticketedit endpoint.
    * The api user sends a "PATCH" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.

    Examples:
      | department_id | service | priority | subject | description           | date       |
      | 3             | finans  | low      | ticket3 | finans ticket updated | 2023-08-23 |

