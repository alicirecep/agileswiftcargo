Feature: As an administrator (admin), I want to be able to update the regular pickup information with the specified id number via API connection.

  @Patch
  Scenario Outline: admin REGULAR When a PATCH request is sent to the api/pickuprequest/regular/edit/{id} endpoint with
  valid authorization, the correct (id), and a body containing valid data (note, parcel_quantity), verify that the status
  code is 200 and the response body contains the message "Updated." Additionally, verify that the "Updated Pickup Request ID"
  in the response body matches the (id) path parameter in the endpoint. Finally, confirm that the regular pickup record has
  been updated by sending a GET request to the api/pickuprequest/{id} endpoint and validating the updated data.

    * The api user sets "api/pickuprequest/regular/edit" path parameters.
    * The api user prepares a PATCH request containing "<note>" and <parcel_quantity> information to send to the api regularedit endpoint.
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "Updated".
    * The api user verifies that the "data" "Updated Pickup Request  ID" information in the returned response body is the same as the id path parameter written in the endpoint.
    * The api user verifies that the "note" is "Note...." by sending a GET request to the "api" "pickuprequest" endpoint with the "data" "Updated Pickup Request  ID" returned in the response body.

    Examples:
      | note     | parcel_quantity |
      | Note.... | 25              |

  @Patch
  Scenario: admin REGULAR When a PATCH request is sent to the api/pickuprequest/regular/edit/{id} endpoint with valid
  authorization, the correct (id), and an empty body, verify that the status code is 400 and the response body contains
  the message "There is no data to update."

    * The api user sets "api/pickuprequest/regular/edit" path parameters.
    * The api user prepares a "PATCH" request that contains no data.
    * The api user sends a "PATCH" request, saves the returned response, and verifies that the status code is '400' with the reason phrase Bad Request.


  Scenario Outline: admin When a PATCH request is sent to the api/pickuprequest/regular/edit/{id} endpoint with valid
  authorization and a body that does not contain an (id) but includes (note, parcel_quantity), verify that the status
  code is 203 and the response body contains the message "No request id."

    * The api user sets "api/pickuprequest/regular/edit" path parameters.
    * The api user prepares a PATCH request containing "<note>" and <parcel_quantity> information to send to the api regularedit endpoint.
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "No request id.".

    Examples:
      | note     | parcel_quantity |
      | Note.... | 25              |


  Scenario Outline: admin When a PATCH request is sent to the api/pickuprequest/regular/edit/{id} endpoint with valid
  authorization and a body containing a non-existent (id) with (note, parcel_quantity), verify that the status code is
  203 and the response body contains the message "No pickup request with this id."

    * The api user sets "api/pickuprequest/regular/edit/41258" path parameters.
    * The api user prepares a PATCH request containing "<note>" and <parcel_quantity> information to send to the api regularedit endpoint.
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "No pickup request with this id.".

    Examples:
      | note     | parcel_quantity |
      | Note.... | 25              |

  @Patch
  Scenario Outline: Invalid Token REGULAR When a PATCH request is sent to the api/pickuprequest/regular/edit/{id} endpoint with
  invalid authorization and a body containing (note, parcel_quantity), verify that the status code is 401 and the response
  body contains the message "Unauthenticated."

    * The api user sets "api/pickuprequest/regular/edit" path parameters.
    * The api user prepares a PATCH request containing "<note>" and <parcel_quantity> information to send to the api regularedit endpoint.
    * The api user sends a "PATCH" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.

    Examples:
      | note     | parcel_quantity |
      | Note.... | 25              |

