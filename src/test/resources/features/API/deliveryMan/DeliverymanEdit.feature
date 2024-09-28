Feature: As an administrator (admin), I want to be able to update Delivery man information with the specified id number via API connection.

  @Patch @US
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


