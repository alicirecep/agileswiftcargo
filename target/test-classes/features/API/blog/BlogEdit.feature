Feature: As an administrator (admin), I want to be able to update the blog information with the specified id number via the API connection.

  @Patch
  Scenario Outline: admin BLOG Validate that when a PATCH request with valid authorization, the correct (id), and valid data
  (title, description, position, status) is sent to the api/blog/edit/{id} endpoint, the response status code is 200,
  and the response body contains the message "Updated". Additionally, verify that the id in the response body matches
  the id in the path parameter, and confirm that the blog entry is successfully updated by sending a GET request to
  api/blog/{id} to validate the updated data.

    * The api user sets "api/blog/edit" path parameters.
    * The api user prepares a PATCH request containing "<title>", "<description>", "<position>" and "<status>" information to send to the api blogedit endpoint.
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "Updated".
    * The api user verifies that the "data" "id" information in the returned response body is the same as the id path parameter written in the endpoint.
    * The api user verifies that the "title" is "Updated Blog" by sending a GET request to the "api" "blog" endpoint with the "data" "id" returned in the response body.

    Examples:
      | title        | description                                                                                                           | position | status |
      | Updated Blog | As online shopping continues to gain popularity, the demand for efficient and reliable logistics services has soared. | 12       | 1      |

  @Patch
  Scenario: admin BLOG Validate that when a PATCH request with valid authorization, the correct (id), but no data
  is sent to the api/blog/edit/{id} endpoint, the response status code is 400, and the response body contains the message
  "No data to update."

    * The api user sets "api/blog/edit" path parameters.
    * The api user prepares a "PATCH" request that contains no data.
    * The api user sends a "PATCH" request, saves the returned response, and verifies that the status code is '400' with the reason phrase Bad Request.


  Scenario Outline: admin Validate that when a PATCH request with valid authorization and a body containing (title,
  description, position, status) but without an (id) is sent to the api/blog/edit/{id} endpoint, the response status
  code is 203, and the response body contains the message "No blog id."

    * The api user sets "api/blog/edit" path parameters.
    * The api user prepares a PATCH request containing "<title>", "<description>", "<position>" and "<status>" information to send to the api blogedit endpoint.
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "No blog id.".

    Examples:
      | title        | description                                                                                                           | position | status |
      | Updated Blog | As online shopping continues to gain popularity, the demand for efficient and reliable logistics services has soared. | 12       | 1      |


  Scenario Outline: admin Validate that when a PATCH request with valid authorization and a body containing (title,
  description, position, status) but with a non-existent (id) is sent to the api/blog/edit/{id} endpoint, the response
  status code is 203, and the response body contains the message "there is no blog with this id"

    * The api user sets "api/blog/edit/2556" path parameters.
    * The api user prepares a PATCH request containing "<title>", "<description>", "<position>" and "<status>" information to send to the api blogedit endpoint.
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "there is no blog with this id".

    Examples:
      | title        | description                                                                                                           | position | status |
      | Updated Blog | As online shopping continues to gain popularity, the demand for efficient and reliable logistics services has soared. | 12       | 1      |

  @Patch
  Scenario Outline: Invalid Token BLOG Validate that when a PATCH request with invalid authorization and a body containing (title,
  description, position, status) is sent to the api/blog/edit/{id} endpoint, the response status code is 401, and the
  response body contains the message "Unauthenticated."

    * The api user sets "api/blog/edit" path parameters.
    * The api user prepares a PATCH request containing "<title>", "<description>", "<position>" and "<status>" information to send to the api blogedit endpoint.
    * The api user sends a "PATCH" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.

    Examples:
      | title        | description                                                                                                           | position | status |
      | Updated Blog | As online shopping continues to gain popularity, the demand for efficient and reliable logistics services has soared. | 12       | 1      |

