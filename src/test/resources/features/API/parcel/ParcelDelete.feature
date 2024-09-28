Feature: As an administrator (admin), I want to be able to delete Parcel information with the specified id number via API connection.

  @Delete
  Scenario: admin PARCEL When a DELETE request with valid authorization and correct {id} is sent to the api/parcel/delete/{id}
  endpoint, it should return a 200 status code with the response body message 'Deleted' The 'Deleted Parcel ID' in the
  response body should match the {id} in the path, and the deletion must be confirmed by sending a GET request to
  api/parcel/{id} to ensure the parcel has been removed.

    * The api user sets "api/parcel/delete" path parameters.
    * The api user sends a "DELETE" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "Deleted".
    * The api user verifies that the "data" "Deleted Parcel ID" information in the returned response body is the same as the id path parameter written in the endpoint.
    * The api user verifies that the "message" is "there is no parcel with this id" by sending a GET request to the "api" "parcel" endpoint with the "data" "Deleted Parcel ID" returned in the response body.


  Scenario: admin When a DELETE request with valid authorization but without an {id} is sent to the api/parcel/delete/{id}
  endpoint, it should return a 203 status code with the response body message 'No id.'

    * The api user sets "api/parcel/delete" path parameters.
    * The api user sends a "DELETE" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "No id.".


  Scenario: admin When a DELETE request with valid authorization and a non-existent {id} is sent to the
  api/parcel/delete/{id} endpoint, it should return a 203 status code with the response body message
  'there is no parcel with this id'

    * The api user sets "api/parcel/delete/3625" path parameters.
    * The api user sends a "DELETE" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "there is no parcel with this id".


  @Delete
  Scenario: Invalid Token PARCEL When a DELETE request with invalid authorization is sent to the api/parcel/delete/{id}
  endpoint, it should return a 401 status code with the response body message 'Unauthenticated.'

    * The api user sets "api/parcel/delete" path parameters.
    * The api user sends a "DELETE" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.

