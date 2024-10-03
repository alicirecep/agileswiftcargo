Feature: As a merchant, I want to be able to update password information via API connection.

  Scenario Outline: merchant When sending a PATCH request to the api/merchant/updatepassword endpoint with valid authorization
  and a body containing the correct data (old_password, new_password), the response should return a status code of 200, and
  the message in the response body should state "Password is changed.".

    * The api user sets "api/merchant/updateprofil" path parameters.
    * The api user prepares a PATCH request containing "<old_password>" and "<new_password>" information to send to the api profiledit endpoint.
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "Password is changed.".

    Examples:
      | old_password | new_password |
      | Agile.0924   | Agile.0924   |


  Scenario: merchant When sending a PATCH request to the api/merchant/updatepassword endpoint with valid authorization
  and no data in the request body, the response should return a status code of 400, and the message in the response body
  should indicate "Old password required.".

    * The api user sets "api/merchant/updateprofil" path parameters.
    * The api user prepares a "PATCH" request that contains no data.
    * The api user sends a "PATCH" request, saves the returned response, and verifies that the status code is '400' with the reason phrase Bad Request.


  Scenario Outline: merchant When sending a PATCH request to the api/merchant/updatepassword endpoint with valid
  authorization and an incorrect old_password in the request body, the response should return a status code of 400,
  and the message in the response body should be "Something went wrong.".

    * The api user sets "api/merchant/updateprofil" path parameters.
    * The api user prepares a PATCH request containing "<old_password>" and "<new_password>" information to send to the api profiledit endpoint.
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user sends a "PATCH" request, saves the returned response, and verifies that the status code is '400' with the reason phrase Bad Request.

    Examples:
      | old_password | new_password |
      | Agile        | Agile.0924   |


  Scenario Outline: Invalid Token When sending a PATCH request to the api/merchant/updatepassword endpoint with invalid
  authorization and a request body containing old_password and new_password, the response should return a status code of
  401, and the message in the response body should be "Unauthenticated.".

    * The api user sets "api/merchant/updateprofil" path parameters.
    * The api user prepares a PATCH request containing "<old_password>" and "<new_password>" information to send to the api profiledit endpoint.
    * The api user sends a "PATCH" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.

    Examples:
      | old_password | new_password |
      | Agile.0924   | Agile.0924   |