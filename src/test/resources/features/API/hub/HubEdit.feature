Feature: As an administrator (admin), I want to be able to update the information of the hub with the specified id number via the API connection.

  @Patch
  Scenario Outline: admin HUB Send a PATCH request to the api/hub/edit/{id} endpoint with valid authorization, correct id, and data
  (name, phone, address), verify that the response status code is 200, the message is 'Updated', and the id in the
  response body matches the id in the path. Then, confirm the update by sending a GET request to api/hub/{id} using
  the same id.

    * The api user sets "api/hub/edit" path parameters.
    # Api kullanicisi "api/hub/edit/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request containing "<name>", "<phone>" and "<address>" information to send to the api hubedit endpoint.
    # Api kullanicisi api hubedit endpointine gondermek icin "<name>", "<phone>" ve "<address>" bilgilerini iceren bir patch request hazirlar
    * The api user sends a "PATCH" request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Updated".
    # Api kullanicisi response bodydeki message bilgisinin "Updated" oldugunu dogrular
    * The api user verifies that the "data" "id" information in the returned response body is the same as the id path parameter written in the endpoint.
    # Api kullanicisi donen response body icindeki "data" "id" bilgisinin endpointde yazan id path parametresi ile ayni oldugunu dogrular
    * The api user verifies that the "name" is "Updated Hub" by sending a GET request to the "api" "hub" endpoint with the "data" "id" returned in the response body.
    # Api kullanicisi response bodyde donen "data" "id" ile "api" "hub" endpoint'ine GET request göndererek "name" bilgisinin "Updated Hub" oldugunu dogrular

    Examples:
      | name        | phone       | address              |
      | Updated Hub | 02589632141 | Updated Hub address. |

  @Patch
  Scenario Outline: admin HUB Send a PATCH request to the api/hub/edit/{id} endpoint with valid authorization, correct id, and
  data (address), verify that the response status code is 200 and the message in the response body is 'Updated'

    * The api user sets "api/hub/edit" path parameters.
    # Api kullanicisi "api/hub/edit/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request containing "<address>" information to send to the api hubedit endpoint.
    # Api kullanicisi api hubedit endpointine gondermek icin "<address>" bilgisini iceren bir patch request hazirlar
    * The api user sends a "PATCH" request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Updated".
    # Api kullanicisi response bodydeki message bilgisinin "Updated" oldugunu dogrular
    * The api user verifies that the "data" "id" information in the returned response body is the same as the id path parameter written in the endpoint.
    # Api kullanicisi donen response body icindeki "data.id" bilgisinin endpointde yazan id path parametresi ile ayni oldugunu dogrular
    * The api user verifies that the "address" is "Only adrss Updated." by sending a GET request to the "api" "hub" endpoint with the "data" "id" returned in the response body.
    # Api kullanicisi response bodyde donen "data" "id" ile "api" "hub" endpoint'ine GET request göndererek "address" bilgisinin "Only adrss Updated." oldugunu dogrular

    Examples:
      | address             |
      | Only adrss Updated. |


  @Patch
  Scenario: admin HUB Send an empty PATCH request to the api/hub/edit/{id} endpoint with valid authorization and
  correct id, verify that the response status code is 400 and the message in the response body is
  'No data to update'

    * The api user sets "api/hub/edit" path parameters.
    # Api kullanicisi "api/hub/edit/{id}" path parametrelerini olusturur
    * The api user prepares a "PATCH" request that contains no data.
    # Api kullanicisi data icermeyen bir patch request hazırlar
    * The api user sends a "PATCH" request, saves the returned response, and verifies that the status code is '400' with the reason phrase Bad Request.
    # Api kullanicisi PATCH request gonderir, donen responsei kaydeder, status codeun '400' ve reason phrase bilgisinin Bad Request oldugunu dogrular


  Scenario Outline: admin Send a PATCH request to the api/hub/edit endpoint with valid authorization, correct data (name,
  phone, address), and no id, verify that the response status code is 203 and the message in the response
  body is 'No id.'

    * The api user sets "api/hub/edit" path parameters.
    # Api kullanicisi "api/hub/edit/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request containing "<name>", "<phone>" and "<address>" information to send to the api hubedit endpoint.
    # Api kullanicisi api hubedit endpointine gondermek icin "<name>", "<phone>" ve "<address>" bilgilerini iceren bir patch request hazirlar
    * The api user sends a "PATCH" request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "No id.".
    # Api kullanicisi response bodydeki message bilgisinin "No id." oldugunu dogrular

    Examples:
      | name        | phone       | address              |
      | Updated Hub | 02589632141 | Updated Hub address. |


  Scenario Outline: admin Send a PATCH request to the api/hub/edit/{id} endpoint with valid authorization,
  correct data (name, phone, address), and a non-existent id, verify that the response status code is
  203 and the message in the response body is 'There is no Hub with this id'

    * The api user sets "api/hub/edit/8526" path parameters.
    # Api kullanicisi "api/hub/edit/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request containing "<name>", "<phone>" and "<address>" information to send to the api hubedit endpoint.
    # Api kullanicisi api hubedit endpointine gondermek icin "<name>", "<phone>" ve "<address>" bilgilerini iceren bir patch request hazirlar
    * The api user sends a "PATCH" request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "There is no Hub with this id".
    # Api kullanicisi response bodydeki message bilgisinin "There is no Hub with this id" oldugunu dogrular

    Examples:
      | name        | phone       | address              |
      | Updated Hub | 02589632141 | Updated Hub address. |


  @Patch
  Scenario Outline: Invalid Token HUB Send a PATCH request to the api/hub/edit/{id} endpoint with invalid
  authorization and correct data (name, phone, address), verify that the response status code is 401
  and the message in the response body is 'Unauthenticated.'

    * The api user sets "api/hub/edit" path parameters.
    # Api kullanicisi "api/hub/edit/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request containing "<name>", "<phone>" and "<address>" information to send to the api hubedit endpoint.
    # Api kullanicisi api hubedit endpointine gondermek icin "<name>", "<phone>" ve "<address>" bilgilerini iceren bir patch request hazirlar
    * The api user sends a "PATCH" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.
    # Api kullanicisi PATCH request gonderir, donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular

    Examples:
      | name        | phone       | address              |
      | Updated Hub | 02589632141 | Updated Hub address. |

