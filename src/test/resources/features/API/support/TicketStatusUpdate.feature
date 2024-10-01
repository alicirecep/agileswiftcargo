Feature: As an administrator (admin), I want to be able to update the status of the ticket with the specified id number via the API connection.

  @Patch @US
  Scenario Outline: admin TICKET Validate that sending a valid authorization header and the correct status data in a GET request
  to the api/ticket/status-update/{id} endpoint returns a status code of 200, with a response body containing the message
  "Status Updated" and an ID that matches the path parameter. Furthermore, confirm that the ticket status is updated by
  sending a GET request to api/ticket/{id} using the returned ID from the response body.

    * The api user sets "api/ticket/status-update" path parameters.
    * The api user prepares a PATCH request containing "<note>" and <parcel_quantity> information to send to the api regularedit endpoint.
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "Updated".
    * The api user verifies that the "data" "Updated Pickup Request  ID" information in the returned response body is the same as the id path parameter written in the endpoint.
    * The api user verifies that the "note" is "Note...." by sending a GET request to the "api" "pickuprequest" endpoint with the "data" "Updated Pickup Request  ID" returned in the response body.

    Examples:
