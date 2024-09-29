Feature: As an administrator (admin), I want to be able to update Delivery man information with the specified id number via API connection.

  @Patch
  Scenario Outline: admin DELIVERY When a PATCH request with valid authorization and correct data (name, mobile, email,
  address, delivery_charge, pickup_charge, return_charge) is sent to the api/deliveryman/edit/{id} endpoint, it should
  return a 200 status code with the response body message 'Updated' The 'id' in the response body should match the
  'id' in the path, and the updated deliveryman record should be verified by sending a GET request to api/deliveryman/{id}.

    * The api user sets "api/deliveryman/edit" path parameters.
    * The api user prepares a PATCH request containing "<name>", "<mobile>", "<email>", "<address>", "<delivery_charge>", "<pickup_charge>" and "<return_charge>" information to send to the api parceledit endpoint.
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "Updated".
    * The api user verifies that the "Delivery Man" "id" information in the returned response body is the same as the id path parameter written in the endpoint.
    * The api user verifies that the "data[0].user.name" is "Delivery Man 748" by sending a GET request to the "api" "deliveryman" endpoint with the "Delivery Man" "id" returned in the response body.

    Examples:
      | name             | mobile      | email                 | address | delivery_charge | pickup_charge | return_charge |
      | Delivery Man 748 | 12589634780 | dvman@deliveryman.com | Atlanta | 100.00          | 200.00        | 30.00         |

  @Patch
  Scenario: admin DELIVERY When a PATCH request with valid authorization and correct (id) but no data is sent to the
  api/deliveryman/edit/{id} endpoint, it should return a 400 status code with the response body message 'No data to update'

    * The api user sets "api/deliveryman/edit" path parameters.
    * The api user prepares a "PATCH" request that contains no data.
    * The api user sends a "PATCH" request, saves the returned response, and verifies that the status code is '400' with the reason phrase Bad Request.


  Scenario Outline: admin When a PATCH request with valid authorization but without an (id) is sent with the body
  (name, mobile, email, address, delivery_charge, pickup_charge, return_charge) to the api/deliveryman/edit/{id}
  endpoint, it should return a 203 status code with the response body message 'No id.'

    * The api user sets "api/deliveryman/edit" path parameters.
    * The api user prepares a PATCH request containing "<name>", "<mobile>", "<email>", "<address>", "<delivery_charge>", "<pickup_charge>" and "<return_charge>" information to send to the api parceledit endpoint.
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "No id.".

    Examples:
      | name             | mobile      | email                 | address | delivery_charge | pickup_charge | return_charge |
      | Delivery Man 748 | 12589634780 | dvman@deliveryman.com | Atlanta | 100.00          | 200.00        | 30.00         |


  Scenario Outline: admin When a PATCH request with valid authorization and a non-existent (id) is sent with the body
  (name, mobile, email, address, delivery_charge, pickup_charge, return_charge) to the api/deliveryman/edit/{id} endpoint,
  it should return a 203 status code with the response message 'there is no deliveryman with this id'

    * The api user sets "api/deliveryman/edit/36521" path parameters.
    * The api user prepares a PATCH request containing "<name>", "<mobile>", "<email>", "<address>", "<delivery_charge>", "<pickup_charge>" and "<return_charge>" information to send to the api parceledit endpoint.
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "there is no deliveryman with this id".

    Examples:
      | name             | mobile      | email                 | address | delivery_charge | pickup_charge | return_charge |
      | Delivery Man 748 | 12589634780 | dvman@deliveryman.com | Atlanta | 100.00          | 200.00        | 30.00         |


  @Patch
  Scenario Outline: Invalid Token DELIVERY When a PATCH request with invalid authorization and the body (name, mobile, email,
  address, delivery_charge, pickup_charge, return_charge) is sent to the api/deliveryman/edit/{id} endpoint, it should
  return a 401 status code with the response message 'Unauthenticated.'

    * The api user sets "api/deliveryman/edit" path parameters.
    * The api user prepares a PATCH request containing "<name>", "<mobile>", "<email>", "<address>", "<delivery_charge>", "<pickup_charge>" and "<return_charge>" information to send to the api parceledit endpoint.
    * The api user sends a "PATCH" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.

    Examples:
      | name             | mobile      | email                 | address | delivery_charge | pickup_charge | return_charge |
      | Delivery Man 748 | 12589634780 | dvman@deliveryman.com | Atlanta | 100.00          | 200.00        | 30.00         |





