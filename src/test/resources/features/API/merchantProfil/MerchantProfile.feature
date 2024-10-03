Feature: As a merchant I would like to be able to access profile information via API connection.

  Scenario Outline: merchant  When sending a GET request to the api/merchant-profile endpoint with valid authorization,
  it should return a status code of 200, with the response body containing a success value of "true" and the fields (name,
  email, mobile, business_name, address) validated.

    * The api user sets "api/merchant-profile" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "success" information in the response body is true.
    * The api user verifies the contents of the data "<name>", "<email>", "<mobile>", "<business_name>" and "<address>" in the response body.

    Examples:
      | name  | email                              | mobile      | business_name | address |
      | Recep | recep.merchant@agileswiftcargo.com | 85284868789 | recep alici   | Was     |


  Scenario: Invalid Token When sending a GET request to the api/merchant-profile endpoint with invalid authorization,
  it should return a status code of 401, and the response body should contain the message "Unauthenticated."

    * The api user sets "api/merchant-profile" path parameters.
    * The api user sends a "GET" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.

