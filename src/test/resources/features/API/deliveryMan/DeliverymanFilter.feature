Feature: As an administrator (admin), I want to be able to filter among the deliverables (with email and name information) via API connection.

  Scenario Outline: admin When a POST request with valid authorization and correct data (name or email) is sent to the
  api/deliveryman/filter endpoint, it should return a 200 status code. Additionally, the user list in the response body,
  including the details (id, name, email, mobile) of the user with id(x), should be verified.

    * The api user sets "api/deliveryman/filter" path parameters.
    * The api user prepares a post request with "<key>" information as "<value>" to send to the api deliveryman filter endpoint.
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies the information in the response body for the entry with the specified <dataindex> index, including <id>, "<name>", "<email>" and "<mobile>".

    Examples:
      | key   | value       | dataindex | id   | name             | email                 | mobile      |
      | email | deliveryman | 1         | 1060 | Delivery Man 748 | dvman@deliveryman.com | 12589634780 |
      | name  | delivery    | 3         | 1060 | Delivery Man 748 | dvman@deliveryman.com | 12589634780 |


  Scenario Outline: Invalid Token When a POST request with invalid authorization and correct data (name or email) is sent
  to the api/deliveryman/filter endpoint, it should return a 401 status code with the response body message 'Unauthenticated.'

    * The api user sets "api/deliveryman/filter" path parameters.
    * The api user prepares a post request with "<key>" information as "<value>" to send to the api deliveryman filter endpoint.
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 401.
    * The api user verifies that the "message" information in the response body is "Unauthenticated.".

    Examples:
      | key   | value       |
      | email | deliveryman |
      | name  | delivery    |
