Feature: As an administrator (admin), I want to be able to delete hub information with the specified id number via API connection.

  @Delete
  Scenario: admin HUB Send a DELETE request to the api/hub/delete/{id} endpoint with valid authorization and correct id, verify
  that the response status code is 200, the message is 'Deleted', and the 'Deleted ID' in the response body matches
  the id in the path. Then, confirm the deletion by sending a GET request to api/hub/{id} to verify the hub has been removed.

    * The api user sets "api/hub/delete" path parameters.
    # Api kullanicisi "api/hub/delete/{id}" path parametrelerini olusturur
    * The api user sends a "DELETE" request and saves the returned response.
    # Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Deleted".
    # Api kullanicisi response bodydeki message bilgisinin "Deleted" oldugunu dogrular
    * The api user verifies that the "data" "Deleted ID" information in the returned response body is the same as the id path parameter written in the endpoint.
    # Api kullanicisi donen response body icindeki "data" "Deleted ID" bilgisinin endpointde yazan id path parametresi ile ayni oldugunu dogrular
    * The api user verifies that the "message" is "there is no hub with this id" by sending a GET request to the "api" "hub" endpoint with the "data" "Deleted ID" returned in the response body.
    # Api kullanicisi response bodyde donen "data" "Deleted ID" ile "api" "hub" endpoint'ine GET request göndererek "message" bilgisinin "there is no hub with this id" oldugunu dogrular


  Scenario: admin Send a DELETE request to the api/hub/delete endpoint with valid authorization and no id,
  verify that the response status code is 203 and the message in the response body is 'No id.'

    * The api user sets "api/hub/delete" path parameters.
    # Api kullanicisi "api/hub/delete/{id}" path parametrelerini olusturur
    * The api user sends a "DELETE" request and saves the returned response.
    # Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "No id.".
    # Api kullanicisi response bodydeki message bilgisinin "No id." oldugunu dogrular


  Scenario: admin Send a DELETE request to the api/hub/delete/{id} endpoint with valid authorization and a
  non-existent id, verify that the response status code is 203 and the message in the response body is
  'there is no hub with this id'

    * The api user sets "api/hub/delete/2563" path parameters.
    # Api kullanicisi "api/hub/delete/{id}" path parametrelerini olusturur
    * The api user sends a "DELETE" request and saves the returned response.
    # Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "there is no hub with this id".
    # Api kullanicisi response bodydeki message bilgisinin "there is no hub with this id" oldugunu dogrular


  @Delete
  Scenario: Invalid Token HUB Send a DELETE request to the api/hub/delete/{id} endpoint with invalid
  authorization, verify that the response status code is 401 and the message in the response body is
  'Unauthenticated.'

    * The api user sets "api/hub/delete" path parameters.
    # Api kullanicisi "api/hub/delete/{id}" path parametrelerini olusturur
    * The api user sends a "DELETE" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.
    # Api kullanicisi DELETE request gonderir, donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular

