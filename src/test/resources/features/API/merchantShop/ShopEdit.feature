Feature: As an administrator (admin), I want to be able to update the shop information with the specified id number via API connection.

  @Patch @US
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

