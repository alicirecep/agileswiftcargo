package stepdefinitions;

import base.BaseTest;
import com.google.gson.Gson;
import io.cucumber.java.en.Given;
import utilities.API_Utilities.API_Methods;
import utilities.API_Utilities.RequestBuilder;

import static org.hamcrest.Matchers.equalTo;
import static org.junit.Assert.*;

public class API_Stepdefinitions extends BaseTest {

    Gson gson = new Gson(); // Gson kütüphanesini kullanarak bir POJO nesnesini JSON formatında bir Stringe dönüştürebilirsiniz.
    RequestBuilder builder = new RequestBuilder();
    String requestBody;

    @Given("The api user sets {string} path parameters.")
    public void the_api_user_sets_path_parameters(String pathParam) {
        if (API_Methods.addedId == 0) {
            API_Methods.pathParam(pathParam);
        } else {
            API_Methods.pathParam(pathParam + "/" + API_Methods.addedId);
        }
    }

    @Given("The api user sends a {string} request and saves the returned response.")
    public void the_api_user_sends_a_request_and_saves_the_returned_response(String httpMethod) {
        if (requestBody == null || requestBody.isEmpty()) {
            API_Methods.sendRequest(httpMethod, null);
        } else {
            API_Methods.sendRequest(httpMethod, requestBody);
        }
    }

    @Given("The api user verifies that the status code is {int}.")
    public void the_api_user_verifies_that_the_status_code_is(int code) {
        API_Methods.statusCodeAssert(code);
    }

    @Given("The api user verifies that the {string} information in the response body is {string}.")
    public void the_api_user_verifies_that_the_information_in_the_response_body_is(String key, String value) {
        API_Methods.assertBody(key, value);
    }

    @Given("The api user sends a {string} request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.")
    public void the_api_user_sends_a_request_saves_the_returned_response_and_verifies_that_the_status_code_is_with_the_reason_phrase_unauthorized(String httpMethod) {
        String response = (requestBody == null) ? API_Methods.tryCatchRequest(httpMethod, null) : API_Methods.tryCatchRequest(httpMethod, requestBody);
        assertEquals(configLoader.getApiConfig("unauthorizedExceptionMessage"), response);
    }

    @Given("The api user verifies that the {string} is {string} by sending a GET request to the {string} {string} endpoint with the {string} {string} returned in the response body.")
    public void the_api_user_verifies_that_the_is_by_sending_a_get_request_to_the_endpoint_with_the_returned_in_the_response_body(String path, String value, String pp1, String pp2, String data, String reponseId) {
        API_Methods.verification(pp1, pp2, data, reponseId, path, value);
    }

    @Given("The api user prepares a {string} request that contains no data.")
    public void the_api_user_prepares_a_request_that_contains_no_data(String httpMethod) {
        requestBody = builder.buildUsingJSONObject();
    }

    @Given("The api user verifies that the {string} {string} information in the returned response body is the same as the id path parameter written in the endpoint.")
    public void the_api_user_verifies_that_the_information_in_the_returned_response_body_is_the_same_as_the_id_path_parameter_written_in_the_endpoint(String data, String reponseId) {
        API_Methods.assertPathParam(data, reponseId);
    }

    // ************************************************ api/hub/list ******************************************************
    @Given("The api user verifies the information in the response body for the entry with the specified {int} index, including {string}, {string}, {string}, {string}, {int}, {string} and {string}.")
    public void the_api_user_verifies_the_information_in_the_response_body_for_the_entry_with_the_specified_index_including_and(int dataIndex, String name, String phone, String address, String current_balance, int status, String created_at, String updated_at) {
        repJP = response.jsonPath();

        assertEquals(name, repJP.getString("data[" + dataIndex + "].name"));
        assertEquals(phone, repJP.getString("data[" + dataIndex + "].phone"));
        assertEquals(address, repJP.getString("data[" + dataIndex + "].address"));
        assertEquals(current_balance, repJP.getString("data[" + dataIndex + "].current_balance"));
        assertEquals(status, repJP.getInt("data[" + dataIndex + "].status"));
        assertEquals(created_at, repJP.getString("data[" + dataIndex + "].created_at"));
        assertEquals(updated_at, repJP.getString("data[" + dataIndex + "].updated_at"));
    }
    // ********************************************************************************************************************

    // ************************************************ api/hub/{id} ******************************************************
    @Given("The api user verifies that the data in the response body includes {int}, {string}, {string}, {string}, {string}, {int}, {string} and {string}.")
    public void the_api_user_verifies_that_the_data_in_the_response_body_includes_and(int id, String name, String phone, String address, String current_balance, int status, String created_at, String updated_at) {
        response.then()
                .assertThat()
                .body("id", equalTo(id),
                        "name", equalTo(name),
                        "phone", equalTo(phone),
                        "address", equalTo(address),
                        "current_balance", equalTo(current_balance),
                        "status", equalTo(status),
                        "created_at", equalTo(created_at),
                        "updated_at", equalTo(updated_at));
    }
    // ********************************************************************************************************************

    // ************************************************ api/hub/add *******************************************************
    @Given("The api user prepares a POST request containing {string}, {string} and {string} information to send to the api hubadd endpoint.")
    public void the_api_user_prepares_a_post_request_containing_and_information_to_send_to_the_api_hubadd_endpoint(String name, String phone, String address) {
        requestBody = builder
                .addParameterForMap("name", name)
                .addParameterForMap("phone", phone)
                .addParameterForMap("address", address)
                .buildUsingMap();

        System.out.println("POST Request Body : " + requestBody);
    }

    @Given("The api user prepares a POST request containing {string} and {string} information to send to the api hubadd endpoint.")
    public void the_api_user_prepares_a_post_request_containing_and_information_to_send_to_the_api_hubadd_endpoint(String phone, String address) {
        requestBody = builder
                .addParameterForMap("phone", phone)
                .addParameterForMap("address", address)
                .buildUsingMap();

        System.out.println("POST Request Body : " + requestBody);
    }
    // ********************************************************************************************************************

    // ******************************************* api/hub/edit/{id} ******************************************************
    @Given("The api user prepares a PATCH request containing {string}, {string} and {string} information to send to the api hubedit endpoint.")
    public void the_api_user_prepares_a_patch_request_containing_and_information_to_send_to_the_api_hubedit_endpoint(String name, String phone, String address) {
        requestBody = builder
                .addParameterForJSONObject("name", name)
                .addParameterForJSONObject("phone", phone)
                .addParameterForJSONObject("address", address)
                .buildUsingJSONObject();

        System.out.println("PATCH Request Body : " + requestBody);
    }

    @Given("The api user prepares a PATCH request containing {string} information to send to the api hubedit endpoint.")
    public void the_api_user_prepares_a_patch_request_containing_information_to_send_to_the_api_hubedit_endpoint(String address) {
        requestBody = builder
                .addParameterForJSONObject("address", address)
                .buildUsingJSONObject();

        System.out.println("PATCH Request Body : " + requestBody);
    }
    // ********************************************************************************************************************
}
