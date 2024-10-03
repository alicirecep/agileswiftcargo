Feature: As a merchant, I would like to be able to update my profile information via API connection.

  Scenario Outline: merchant When sending a PATCH request to the api/merchant/updateprofile endpoint with valid authorization
  and correct data (name, email, mobile, business_name, address), the response should return a status code of 200, and the
  success value in the response body should be true. Additionally, it should be verified that the profile record has been
  updated in the API by comparing the updated data in the request body with the values returned in the response body.

    * The api user sets "api/merchant/updateprofil" path parameters.
    * The api user prepares a PATCH request containing "<name>", "<email>", "<mobile>", "<business_name>" and "<address>" information to send to the api profiledit endpoint.
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "success" information in the response body is true.
    * The api user compares the data sent by making changes in the post body with the value received in the response body.

    Examples:
      | name  | email                              | mobile      | business_name | address |
      | Recep | recep.merchant@agileswiftcargo.com | 85284868789 | recep alici   | Was     |


  Scenario: merchant When sending a PATCH request to the api/merchant/updateprofile endpoint with valid authorization but
  without any data, the response should return a status code of 400, and the message in the response body should indicate
  "There is no data to update."

    * The api user sets "api/merchant/updateprofil" path parameters.
    * The api user prepares a "PATCH" request that contains no data.
    * The api user sends a "PATCH" request, saves the returned response, and verifies that the status code is '400' with the reason phrase Bad Request.


  Scenario Outline: Invalid Token When sending a PATCH request to the api/merchant/updateprofile endpoint with invalid
  authorization and a body containing (name, email, mobile, business_name, address), the response should return a status
  code of 401, and the message in the response body should indicate "Unauthenticated."

    * The api user sets "api/merchant/updateprofil" path parameters.
    * The api user prepares a PATCH request containing "<name>", "<email>", "<mobile>", "<business_name>" and "<address>" information to send to the api profiledit endpoint.
    * The api user sends a "PATCH" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.

    Examples:
      | name  | email                              | mobile      | business_name | address |
      | Recep | recep.merchant@agileswiftcargo.com | 85284868789 | recep alici   | Was     |

