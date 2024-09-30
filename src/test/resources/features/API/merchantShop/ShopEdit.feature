Feature: As an administrator (admin), I want to be able to update the shop information with the specified id number via API connection.

  @Patch
  Scenario Outline: admin SHOP When a PATCH request is sent to the api/shop/edit/{id} endpoint with valid authorization,
  the correct (id), and valid data (merchant_id, name, contact_no, address, status), it must return a status code of 200
  with the message "Updated". Additionally, the response body must confirm that the "Updated Shop ID" matches the id in
  the path parameter, and the shop record must be verified as updated by sending a GET request to api/shop/{id}.

    * The api user sets "api/shop/edit" path parameters.
    * The api user prepares a PATCH request containing <merchant_id>, "<name>", "<contact_no>", "<address>" and <status> information to send to the api shopedit endpoint.
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "Updated".
    * The api user verifies that the "data" "Updated Shop ID" information in the returned response body is the same as the id path parameter written in the endpoint.
    * The api user verifies that the "name" is "MNG" by sending a GET request to the "api" "shop" endpoint with the "data" "Updated Shop ID" returned in the response body.

    Examples:
      | merchant_id | name | contact_no | address  | status |
      | 8           | MNG  | 1111111111 | New York | 1      |

  @Patch
  Scenario: admin SHOP When a PATCH request is sent to the api/shop/edit/{id} endpoint with valid authorization, the correct
  (id), but no data, it must return a status code of 400 with the message "There is no data to update."

    * The api user sets "api/shop/edit" path parameters.
    * The api user prepares a "PATCH" request that contains no data.
    * The api user sends a "PATCH" request, saves the returned response, and verifies that the status code is '400' with the reason phrase Bad Request.

  @Patch
  Scenario Outline: admin SHOP When a PATCH request is sent to the api/shop/edit/{id} endpoint with valid authorization,
  the correct (id), but an invalid merchant_id, it must return a status code of 400 with the message
  "there is no merchant with this id"

    * The api user sets "api/shop/edit" path parameters.
    * The api user prepares a PATCH request containing <merchant_id>, "<name>", "<contact_no>", "<address>" and <status> information to send to the api shopedit endpoint.
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 400.
    * The api user verifies that the "message" information in the response body is "there is no merchant with this id".

    Examples:
      | merchant_id | name | contact_no | address  | status |
      | 7           | MNG  | 1111111111 | New York | 1      |


  Scenario Outline: admin When a PATCH request is sent to the api/shop/edit/{id} endpoint with valid authorization and
  a body missing the id (but containing merchant_id, name, contact_no, address, and status), it must return a status
  code of 203 with the message "No shop id."

    * The api user sets "api/shop/edit" path parameters.
    * The api user prepares a PATCH request containing <merchant_id>, "<name>", "<contact_no>", "<address>" and <status> information to send to the api shopedit endpoint.
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "No shop id.".

    Examples:
      | merchant_id | name | contact_no | address  | status |
      | 8           | MNG  | 1111111111 | New York | 1      |


  Scenario Outline: admin When a PATCH request is sent to the api/shop/edit/{id} endpoint with valid authorization and a
  non-existent id in the body (along with merchant_id, name, contact_no, address, and status), it must return a status
  code of 203 with the message "No pickup request with this id."

    * The api user sets "api/shop/edit/6254" path parameters.
    * The api user prepares a PATCH request containing <merchant_id>, "<name>", "<contact_no>", "<address>" and <status> information to send to the api shopedit endpoint.
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "No pickup request with this id.".

    Examples:
      | merchant_id | name | contact_no | address  | status |
      | 8           | MNG  | 1111111111 | New York | 1      |


  @Patch
  Scenario Outline: Invalid Token SHOP When a PATCH request is sent to the api/shop/edit/{id} endpoint with invalid
  authorization and a body containing merchant_id, name, contact_no, address, and status, the status code should be
  401, and the response message should be "Unauthenticated."

    * The api user sets "api/shop/edit" path parameters.
    * The api user prepares a PATCH request containing <merchant_id>, "<name>", "<contact_no>", "<address>" and <status> information to send to the api shopedit endpoint.
    * The api user sends a "PATCH" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.

    Examples:
      | merchant_id | name | contact_no | address  | status |
      | 8           | MNG  | 1111111111 | New York | 1      |

