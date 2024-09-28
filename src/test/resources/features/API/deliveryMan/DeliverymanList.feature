Feature: As an administrator (admin) I want to be able to access the Delivery Man list via API connection.

  Scenario Outline: admin When a GET request with valid authorization is sent to the api/deliveryman/list endpoint, it should
  return a 200 status code. Additionally, the details of the deliveryman with id(x) in the response body, including user_id,
  status, delivery_charge, pickup_charge, return_charge, current_balance, opening_balance, driving_license_image_id,
  created_at, and updated_at, should be verified.

    * The api user sets "api/deliveryman/list" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies the information in the response body for the entry with the specified <dataindex> index, including <user_id>, <status>, "<delivery_charge>", "<pickup_charge>", "<return_charge>", "<current_balance>", "<opening_balance>", "<created_at>" and "<updated_at>".

    Examples:
      | dataindex | user_id | status | delivery_charge | pickup_charge | return_charge | current_balance | opening_balance | created_at                  | updated_at                  |
      | 1         | 1064    | 1      | 10.00           | 200.00        | 30.00         | 0.00            | 0.00            | 2024-09-28T13:16:38.000000Z | 2024-09-28T13:18:57.000000Z |


  Scenario: Invalid Token When a GET request with invalid authorization is sent to the api/deliveryman/list endpoint,
  it should return a 401 status code with the response body message 'Unauthenticated.'

    * The api user sets "api/deliveryman/list" path parameters.
    * The api user sends a "GET" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.

