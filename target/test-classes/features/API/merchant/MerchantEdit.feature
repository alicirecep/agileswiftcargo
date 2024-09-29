Feature: As an administrator (admin), I want to be able to update merchant information with the specified id number via API connection.

  @Patch
  Scenario Outline: admin MERCHANT When a valid PATCH request is sent to the api/merchant/edit/{id} endpoint with valid
  authorization, the correct id, and updated data (business_name, mobile, email), it should return a status code of 200
  with a response body message of "Updated" The id in the response body must match the id path parameter, and the updated
  merchant record should be verified by sending a GET request to api/merchant/{id}.

    * The api user sets "api/merchant/edit" path parameters.
    * The api user prepares a PATCH request containing "<business_name>", "<mobile>" and "<email>" information to send to the api merchantedit endpoint.
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "Updated".
    * The api user verifies that the "Merchant" "id" information in the returned response body is the same as the id path parameter written in the endpoint.
    * The api user verifies that the "business_name" is "Merchant Firm AS" by sending a GET request to the "api" "merchant" endpoint with the "Merchant" "id" returned in the response body.

    Examples:
      | business_name    | mobile     | email             |
      | Merchant Firm AS | 9999999990 | test787@gmail.com |


  @Patch
  Scenario: admin MERCHANT When a valid PATCH request is sent to the api/merchant/edit/{id} endpoint with valid
  authorization, the correct id, and no data, it should return a status code of 400 with a response body message
  of "No data to update"

    * The api user sets "api/merchant/edit" path parameters.
    * The api user prepares a "PATCH" request that contains no data.
    * The api user sends a "PATCH" request, saves the returned response, and verifies that the status code is '400' with the reason phrase Bad Request.


  Scenario Outline: admin When a valid PATCH request is sent to the api/merchant/edit/{id} endpoint with valid
  authorization and a body lacking an id (containing only business_name, mobile, and email), it must return a
  status code of 203 with the message "No id."

    * The api user sets "api/merchant/edit" path parameters.
    * The api user prepares a PATCH request containing "<business_name>", "<mobile>" and "<email>" information to send to the api merchantedit endpoint.
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "No id.".

    Examples:
      | business_name    | mobile     | email             |
      | Merchant Firm AS | 9999999990 | test787@gmail.com |


  Scenario Outline: admin When a valid PATCH request is sent to the api/merchant/edit/{id} endpoint with valid authorization
  and a non-existent id (including business_name, mobile, and email), it must return a status code of 203 with the message
  "there is no merchant with this id"

    * The api user sets "api/merchant/edit/8965" path parameters.
    * The api user prepares a PATCH request containing "<business_name>", "<mobile>" and "<email>" information to send to the api merchantedit endpoint.
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "there is no merchant with this id".

    Examples:
      | business_name    | mobile     | email             |
      | Merchant Firm AS | 9999999990 | test787@gmail.com |


  @Patch
  Scenario Outline: Invalid Token MERCHANT When an invalid authorization is used to send a PATCH request to the api/merchant/edit/{id}
  endpoint with a body containing business_name, mobile, and email, it must return a status code of 401 with the message
  "Unauthenticated."

    * The api user sets "api/merchant/edit" path parameters.
    * The api user prepares a PATCH request containing "<business_name>", "<mobile>" and "<email>" information to send to the api merchantedit endpoint.
    * The api user sends a "PATCH" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.

    Examples:
      | business_name    | mobile     | email             |
      | Merchant Firm AS | 9999999990 | test787@gmail.com |

