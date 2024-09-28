Feature: As an administrator (admin), I want to be able to access the detailed information of the Delivery Man with the specified id number via the API connection.

  Scenario Outline: admin When a GET request with valid authorization and correct data (id) is sent to the api/deliveryman/{id}
  endpoint, it should return a 200 status code with the response body message 'Success.' Additionally, the response body
  should include the details (id, user_id, status, delivery_charge, pickup_charge, return_charge, current_balance,
  opening_balance, driving_license_image_id, created_at, and updated_at).

    * The api user sets "api/deliveryman/<id>" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "Success".
    * The api user verifies that the data in the response body includes <id>, <user_id>, <status>, "<delivery_charge>", "<pickup_charge>", "<return_charge>", "<current_balance>", "<opening_balance>", "<created_at>" and "<updated_at>".

    Examples:
      | id  | id  | user_id | status | delivery_charge | pickup_charge | return_charge | current_balance | opening_balance | created_at                  | updated_at                  |
      | 404 | 404 | 1010    | 1      | 0.00            | 0.00          | 0.00          | 0.00            | 0.00            | 2024-09-11T12:07:38.000000Z | 2024-09-11T12:07:38.000000Z |


  Scenario: admin When a GET request with valid authorization but without an {id} is sent to the api/deliveryman/{id}
  endpoint, it should return a 203 status code with the response body message 'No id.'

    * The api user sets "api/deliveryman" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "No id.".


  Scenario Outline: admin When a GET request with valid authorization and a non-existent {id} is sent to the
  api/deliveryman/{id} endpoint, it should return a 203 status code with the response body message
  'there is no deliveryman with this id'

    * The api user sets "api/deliveryman/<id>" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "there is no deliveryman with this id".

    Examples:
      | id   |
      | 5236 |


  Scenario Outline: Invalid Token When a GET request with invalid authorization is sent to the api/deliveryman/{id} endpoint,
  it should return a 401 status code with the response body message 'Unauthenticated.'

    * The api user sets "api/deliveryman/<id>" path parameters.
    * The api user sends a "GET" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.

    Examples:
      | id  |
      | 404 |