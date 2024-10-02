package stepdefinitions;

import base.BaseTest;
import com.google.gson.Gson;
import io.cucumber.java.en.Given;
import org.hamcrest.Matchers;
import pojos.merchant.MerchantPojo;
import pojos.packaging.PackagingPojo;
import pojos.shop.ShopPojo;
import pojos.ticket.TicketPojo;
import utilities.API_Utilities.API_Methods;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static org.hamcrest.Matchers.*;
import static org.junit.Assert.*;

public class API_Stepdefinitions extends BaseTest {

    Gson gson = new Gson(); // Gson kütüphanesini kullanarak bir POJO nesnesini JSON formatında bir Stringe dönüştürebilirsiniz.
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

    @Given("The api user sends a {string} request, saves the returned response, and verifies that the status code is '400' with the reason phrase Bad Request.")
    public void the_api_user_sends_a_request_saves_the_returned_response_and_verifies_that_the_status_code_is_with_the_reason_phrase_bad_request(String httpMethod) {
        assertEquals(configLoader.getApiConfig("badRequestExceptionMessage"), API_Methods.tryCatchRequest(httpMethod, requestBody));
    }

    @Given("The api user prepares a POST request to send to the api {string} add endpoint.")
    public void the_api_user_prepares_a_post_request_to_send_to_the_api_add_endpoint(String folder) {
        map = testData.requestBody(folder);
        requestBody = gson.toJson(map);

        System.out.println("POST Request Body : " + requestBody);
    }

    @Given("The api user prepares a POST request containing {string}, {string} and {string} information to send to the api expressadd endpoint.")
    public void the_api_user_prepares_a_post_request_containing_and_information_to_send_to_the_api_expressadd_endpoint(String name, String phone, String address) {
        requestBody = builder
                .addParameterForMap("name", name)
                .addParameterForMap("phone", phone)
                .addParameterForMap("address", address)
                .buildUsingMap();

        System.out.println("POST Request Body : " + requestBody);
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

    // ************************************************ api/parcel/list ***************************************************
    @Given("The api user verifies the information in the response body for the entry with the specified {int} index, including {int}, {int}, {string}, {string}, {string}, {string}, {string}, {string}, {int}, {int}, {int}, {int}, {int}, {int} and {string}.")
    public void the_api_user_verifies_the_information_in_the_response_body_for_the_entry_with_the_specified_index_including_and(int dataIndex, int merchant_id, int merchant_shop_id, String pickup_address, String pickup_phone, String customer_name, String customer_phone, String customer_address, String invoice_no, int category_id, int weight, int delivery_type_id, int first_hub_id, int hub_id, int transfer_hub_id, String cash_collection) {
        repJP = response.jsonPath();

        assertEquals(merchant_id, repJP.getInt("data[" + dataIndex + "].merchant_id"));
        assertEquals(merchant_shop_id, repJP.getInt("data[" + dataIndex + "].merchant_shop_id"));
        assertEquals(pickup_address, repJP.getString("data[" + dataIndex + "].pickup_address"));
        assertEquals(pickup_phone, repJP.getString("data[" + dataIndex + "].pickup_phone"));
        assertEquals(customer_name, repJP.getString("data[" + dataIndex + "].customer_name"));
        assertEquals(customer_phone, repJP.getString("data[" + dataIndex + "].customer_phone"));
        assertEquals(customer_address, repJP.getString("data[" + dataIndex + "].customer_address"));
        assertEquals(invoice_no, repJP.getString("data[" + dataIndex + "].invoice_no"));
        assertEquals(category_id, repJP.getInt("data[" + dataIndex + "].category_id"));
        assertEquals(weight, repJP.getInt("data[" + dataIndex + "].weight"));
        assertEquals(delivery_type_id, repJP.getInt("data[" + dataIndex + "].delivery_type_id"));
        assertNull(repJP.get("data[" + dataIndex + "].packaging_id"));
        assertEquals(first_hub_id, repJP.getInt("data[" + dataIndex + "].first_hub_id"));
        assertEquals(hub_id, repJP.getInt("data[" + dataIndex + "].hub_id"));
        assertEquals(transfer_hub_id, repJP.getInt("data[" + dataIndex + "].transfer_hub_id"));
        assertEquals(cash_collection, repJP.getString("data[" + dataIndex + "].cash_collection"));
    }
    // ********************************************************************************************************************

    // ************************************************ api/parcel/{id}****************************************************
    @Given("The api user verifies that the {string} information in the response body is true.")
    public void the_api_user_verifies_that_the_information_in_the_response_body_is_true(String key) {
        response.then()
                .assertThat()
                .body(key, equalTo(true));
    }

    @Given("The api user verifies that the data in the response body includes {int}, {int}, {int}, {string}, {string}, {string}, {string}, {string}, {string}, {int}, {int}, {int}, {int}, {int}, {int} and {string}.")
    public void the_api_user_verifies_that_the_data_in_the_response_body_includes_and(int id, int merchant_id, int merchant_shop_id, String pickup_address, String pickup_phone, String customer_name, String customer_phone, String customer_address, String invoice_no, int category_id, int weight, int delivery_type_id, int first_hub_id, int hub_id, int transfer_hub_id, String cash_collection) {
        repJP = response.jsonPath();

        assertEquals(id, repJP.getInt("data.id"));
        assertEquals(merchant_id, repJP.getInt("data.merchant_id"));
        assertEquals(merchant_shop_id, repJP.getInt("data.merchant_shop_id"));
        assertEquals(pickup_address, repJP.getString("data.pickup_address"));
        assertEquals(pickup_phone, repJP.getString("data.pickup_phone"));
        assertEquals(customer_name, repJP.getString("data.customer_name"));
        assertEquals(customer_phone, repJP.getString("data.customer_phone"));
        assertEquals(customer_address, repJP.getString("data.customer_address"));
        assertEquals(invoice_no, repJP.getString("data.invoice_no"));
        assertEquals(category_id, repJP.getInt("data.category_id"));
        assertEquals(weight, repJP.getInt("data.weight"));
        assertEquals(delivery_type_id, repJP.getInt("data.delivery_type_id"));
        assertNull(repJP.get("data.packaging_id"));
        assertEquals(first_hub_id, repJP.getInt("data.first_hub_id"));
        assertEquals(hub_id, repJP.getInt("data.hub_id"));
        assertEquals(transfer_hub_id, repJP.getInt("data.transfer_hub_id"));
        assertEquals(cash_collection, repJP.getString("data.cash_collection"));
    }

    // ********************************************************************************************************************

    // ************************************************ api/parcel/add ****************************************************
    @Given("The api user prepares a POST request containing {int}, {int}, {int}, {string}, {string} and {string} information to send to the api hubadd endpoint.")
    public void the_api_user_prepares_a_post_request_containing_and_information_to_send_to_the_api_hubadd_endpoint(int merchant_shop_id, int category_id, int delivery_type_id, String customer_name, String customer_phone, String customer_address) {
        requestBody = builder
                .addParameterForJSONObject("merchant_shop_id", merchant_shop_id)
                .addParameterForJSONObject("category_id", category_id)
                .addParameterForJSONObject("delivery_type_id", delivery_type_id)
                .addParameterForJSONObject("customer_name", customer_name)
                .addParameterForJSONObject("customer_phone", customer_phone)
                .addParameterForJSONObject("customer_address", customer_address)
                .buildUsingJSONObject();

        System.out.println("POST Request Body : " + requestBody);
    }
    // ********************************************************************************************************************

    // ******************************************** api/parcel/edit/{id} **************************************************
    @Given("The api user prepares a PATCH request containing {string}, {string} and {string} information to send to the api parceledit endpoint.")
    public void the_api_user_prepares_a_patch_request_containing_and_information_to_send_to_the_api_parceledit_endpoint(String customer_name, String customer_phone, String customer_address) {
        requestBody = builder
                .addParameterForMap("customer_name", customer_name)
                .addParameterForMap("customer_phone", customer_phone)
                .addParameterForMap("customer_address", customer_address)
                .buildUsingMap();

        System.out.println("PATCH Request Body : " + requestBody);
    }
    // ********************************************************************************************************************

    // ******************************************** api/deliveryman/list **************************************************
    @Given("The api user verifies the information in the response body for the entry with the specified {int} index, including {int}, {int}, {string}, {string}, {string}, {string}, {string}, {string} and {string}.")
    public void the_api_user_verifies_the_information_in_the_response_body_for_the_entry_with_the_specified_index_including_and(int dataIndex, int user_id, int status, String delivery_charge, String pickup_charge, String return_charge, String current_balance, String opening_balance, String created_at, String updated_at) {
        response.then()
                .assertThat()
                .body("[" + dataIndex + "].user_id", equalTo(user_id),
                        "[" + dataIndex + "].status", equalTo(status),
                        "[" + dataIndex + "].delivery_charge", equalTo(delivery_charge),
                        "[" + dataIndex + "].pickup_charge", equalTo(pickup_charge),
                        "[" + dataIndex + "].return_charge", equalTo(return_charge),
                        "[" + dataIndex + "].current_balance", equalTo(current_balance),
                        "[" + dataIndex + "].opening_balance", equalTo(opening_balance),
                        "[" + dataIndex + "].driving_license_image_id", nullValue(),
                        "[" + dataIndex + "].created_at", equalTo(created_at),
                        "[" + dataIndex + "].updated_at", equalTo(updated_at));
    }
    // ********************************************************************************************************************

    // ******************************************** api/deliveryman/{id} **************************************************
    @Given("The api user verifies that the data in the response body includes {int}, {int}, {int}, {string}, {string}, {string}, {string}, {string}, {string} and {string}.")
    public void the_api_user_verifies_that_the_data_in_the_response_body_includes_and(int id, int user_id, int status, String delivery_charge, String pickup_charge, String return_charge, String current_balance, String opening_balance, String created_at, String updated_at) {
        map = response.as(HashMap.class);

        assertEquals(id, ((Map) (((List) (map.get("data"))).get(0))).get("id"));
        assertEquals(user_id, ((Map) (((List) (map.get("data"))).get(0))).get("user_id"));
        assertEquals(status, ((Map) (((List) (map.get("data"))).get(0))).get("status"));
        assertEquals(delivery_charge, ((Map) (((List) (map.get("data"))).get(0))).get("delivery_charge"));
        assertEquals(pickup_charge, ((Map) (((List) (map.get("data"))).get(0))).get("pickup_charge"));
        assertEquals(return_charge, ((Map) (((List) (map.get("data"))).get(0))).get("return_charge"));
        assertEquals(current_balance, ((Map) (((List) (map.get("data"))).get(0))).get("current_balance"));
        assertEquals(opening_balance, ((Map) (((List) (map.get("data"))).get(0))).get("opening_balance"));
        assertNull(((Map) (((List) (map.get("data"))).get(0))).get("driving_license_image_id"));
        assertEquals(created_at, ((Map) (((List) (map.get("data"))).get(0))).get("created_at"));
        assertEquals(updated_at, ((Map) (((List) (map.get("data"))).get(0))).get("updated_at"));
    }
    // ********************************************************************************************************************

    // ******************************************** api/deliveryman/filter ************************************************
    @Given("The api user prepares a post request with {string} information as {string} to send to the api deliveryman filter endpoint.")
    public void the_api_user_prepares_a_post_request_with_information_as_to_send_to_the_api_deliveryman_filter_endpoint(String key, String value) {
        requestBody = builder
                .addParameterForMap(key, value)
                .buildUsingMap();

        System.out.println("POST Request Body : " + requestBody);
    }

    @Given("The api user verifies the information in the response body for the entry with the specified {int} index, including {int}, {string}, {string} and {string}.")
    public void the_api_user_verifies_the_information_in_the_response_body_for_the_entry_with_the_specified_index_including_and(int dataIndex, Integer id, String name, String email, String mobile) {
        response.then()
                .assertThat()
                .body("[" + dataIndex + "].user.id", equalTo(id),
                        "[" + dataIndex + "].user.name", equalTo(name),
                        "[" + dataIndex + "].user.email", equalTo(email),
                        "[" + dataIndex + "].user.mobile", equalTo(mobile));
    }
    // ********************************************************************************************************************

    // ******************************************** api/deliveryman/edit/{id} *********************************************
    @Given("The api user prepares a PATCH request containing {string}, {string}, {string}, {string}, {string}, {string} and {string} information to send to the api parceledit endpoint.")
    public void the_api_user_prepares_a_patch_request_containing_and_information_to_send_to_the_api_parceledit_endpoint(String name, String mobile, String email, String address, String delivery_charge, String pickup_charge, String return_charge) {
        requestBody = builder
                .addParameterForJSONObject("name", name)
                .addParameterForJSONObject("mobile", mobile)
                .addParameterForJSONObject("email", email)
                .addParameterForJSONObject("address", address)
                .addParameterForJSONObject("delivery_charge", delivery_charge)
                .addParameterForJSONObject("pickup_charge", pickup_charge)
                .addParameterForJSONObject("return_charge", return_charge)
                .buildUsingJSONObject();

        System.out.println("PATCH Request Body : " + requestBody);
    }
    // ********************************************************************************************************************

    // ******************************************** api/merchant/list *****************************************************
    @Given("The api user verifies the information in the response body for the entry with the specified {int} index, including {int}, {string}, {string}, {string}, {string} and {string}.")
    public void the_api_user_verifies_the_information_in_the_response_body_for_the_entry_with_the_specified_index_including_and(int dataIndex, int user_id, String business_name, String merchant_unique_id, String current_balance, String opening_balance, String vat) {
        response.then()
                .assertThat()
                .body("[" + dataIndex + "].user_id", equalTo(user_id),
                        "[" + dataIndex + "].business_name", equalTo(business_name),
                        "[" + dataIndex + "].merchant_unique_id", equalTo(merchant_unique_id),
                        "[" + dataIndex + "].current_balance", equalTo(current_balance),
                        "[" + dataIndex + "].opening_balance", equalTo(opening_balance),
                        "[" + dataIndex + "].vat", equalTo(vat));
    }
    // ********************************************************************************************************************

    // ******************************************** api/merchant/{id} *****************************************************
    @Given("The api user verifies that the data in the response body includes {int}, {int}, {string}, {string}, {string}, {string} and {string}.")
    public void the_api_user_verifies_that_the_data_in_the_response_body_includes_and(int id, int user_id, String business_name, String merchant_unique_id, String current_balance, String opening_balance, String vat) {
        response.then()
                .assertThat()
                .body("id", equalTo(id),
                        "user_id", equalTo(user_id),
                        "business_name", equalTo(business_name),
                        "merchant_unique_id", equalTo(merchant_unique_id),
                        "current_balance", equalTo(current_balance),
                        "opening_balance", equalTo(opening_balance),
                        "vat", equalTo(vat));
    }
    // ********************************************************************************************************************

    // ****************************************** api/merchant/edit/{id} **************************************************
    @Given("The api user prepares a PATCH request containing {string}, {string} and {string} information to send to the api merchantedit endpoint.")
    public void the_api_user_prepares_a_patch_request_containing_and_information_to_send_to_the_api_merchantedit_endpoint(String business_name, String mobile, String email) {
        MerchantPojo merchantPojo = new MerchantPojo(business_name, mobile, email);
        requestBody = gson.toJson(merchantPojo);

        System.out.println("PATCH Request Body : " + requestBody);
    }
    // ********************************************************************************************************************

    // *********************************************** api/shop/list ******************************************************
    @Given("The api user verifies the information in the response body for the entry with the specified {int} index, including {int}, {string}, {string}, {string}, {int}, {int}, {string} and {string}.")
    public void the_api_user_verifies_the_information_in_the_response_body_for_the_entry_with_the_specified_index_including_and(int dataIndex, int merchant_id, String name, String contact_no, String address, int status, int default_shop, String created_at, String updated_at) {
        repJP = response.jsonPath();

        assertEquals(merchant_id, repJP.getInt("[" + dataIndex + "].merchant_id"));
        assertEquals(name, repJP.getString("[" + dataIndex + "].name"));
        assertEquals(contact_no, repJP.getString("[" + dataIndex + "].contact_no"));
        assertEquals(address, repJP.getString("[" + dataIndex + "].address"));
        assertEquals(status, repJP.getInt("[" + dataIndex + "].status"));
        assertEquals(default_shop, repJP.getInt("[" + dataIndex + "].default_shop"));
        assertEquals(created_at, repJP.getString("[" + dataIndex + "].created_at"));
        assertEquals(updated_at, repJP.getString("[" + dataIndex + "].updated_at"));
    }
    // ********************************************************************************************************************

    // *********************************************** api/shop/{id} ******************************************************
    @Given("The api user verifies that the data in the response body includes {int}, {int}, {string}, {string}, {string}, {int}, {int}, {string} and {string}.")
    public void the_api_user_verifies_that_the_data_in_the_response_body_includes_and(int id, int merchant_id, String name, String contact_no, String address, int status, int default_shop, String created_at, String updated_at) {
        ShopPojo shopPojo = new ShopPojo(id, merchant_id, name, contact_no, address, status, default_shop, created_at, updated_at);

        assertEquals(id, shopPojo.getId());
        assertEquals(merchant_id, shopPojo.getMerchantId());
        assertEquals(name, shopPojo.getName());
        assertEquals(contact_no, shopPojo.getContactNo());
        assertEquals(address, shopPojo.getAddress());
        assertEquals(status, shopPojo.getStatus());
        assertEquals(default_shop, shopPojo.getDefaultShop());
        assertEquals(created_at, shopPojo.getCreatedAt());
        assertEquals(updated_at, shopPojo.getUpdatedAt());

    }
    // ********************************************************************************************************************

    // *********************************************** api/shop/add *******************************************************
    @Given("The api user prepares a POST request containing {string}, {string}, {string} and {int} information to send to the api shopadd endpoint.")
    public void the_api_user_prepares_a_post_request_containing_and_information_to_send_to_the_api_shopadd_endpoint(String name, String contact_no, String address, int status) {
        requestBody = builder
                .addParameterForJSONObject("name", name)
                .addParameterForJSONObject("contact_no", contact_no)
                .addParameterForJSONObject("address", address)
                .addParameterForJSONObject("status", status)
                .buildUsingJSONObject();

        System.out.println("POST Request Body : " + requestBody);
    }

    @Given("The api user prepares a POST request containing {int}, {string}, {string}, {string} and {int} information to send to the api shopadd endpoint.")
    public void the_api_user_prepares_a_post_request_containing_and_information_to_send_to_the_api_shopadd_endpoint(int merchant_id, String name, String contact_no, String address, int status) {
        requestBody = builder
                .addParameterForJSONObject("merchant_id", merchant_id)
                .addParameterForJSONObject("name", name)
                .addParameterForJSONObject("contact_no", contact_no)
                .addParameterForJSONObject("address", address)
                .addParameterForJSONObject("status", status)
                .buildUsingJSONObject();

        System.out.println("POST Request Body : " + requestBody);
    }
    // ********************************************************************************************************************

    // ********************************************* api/shop/edit/{id} ***************************************************
    @Given("The api user prepares a PATCH request containing {int}, {string}, {string}, {string} and {int} information to send to the api shopedit endpoint.")
    public void the_api_user_prepares_a_patch_request_containing_and_information_to_send_to_the_api_shopedit_endpoint(int merchant_id, String name, String contact_no, String address, int status) {
        requestBody = builder
                .addParameterForJSONObject("merchant_id", merchant_id)
                .addParameterForJSONObject("name", name)
                .addParameterForJSONObject("contact_no", contact_no)
                .addParameterForJSONObject("address", address)
                .addParameterForJSONObject("status", status)
                .buildUsingJSONObject();

        System.out.println("PATCH Request Body : " + requestBody);
    }
    // ********************************************************************************************************************

    // *************************************** api/pickuprequest/all-regular **********************************************
    @Given("The api user verifies the information in the response body for the entry with the specified {int} index, including {string}, {int}, {string}, {string}, {int}, {string}, {int}, {int}, {string} and {string}.")
    public void the_api_user_verifies_the_information_in_the_response_body_for_the_entry_with_the_specified_index_including_and(int dataIndex, String request_type, int merchant_id, String address, String note, int parcel_quantity, String cod_amount, int weight, int exchange, String created_at, String updated_at) {
        repJP = response.jsonPath();

        assertEquals(request_type, repJP.getString("[" + dataIndex + "].request_type"));
        assertEquals(merchant_id, repJP.getInt("[" + dataIndex + "].merchant_id"));
        assertEquals(address, repJP.getString("[" + dataIndex + "].address"));
        assertEquals(note, repJP.getString("[" + dataIndex + "].note"));
        assertEquals(parcel_quantity, repJP.getInt("[" + dataIndex + "].parcel_quantity"));
        assertNull(repJP.get("[" + dataIndex + "].name"));
        assertNull(repJP.get("[" + dataIndex + "].phone"));
        assertEquals(cod_amount, repJP.getString("[" + dataIndex + "].cod_amount"));
        assertNull(repJP.get("[" + dataIndex + "].invoice"));
        assertEquals(weight, repJP.getInt("[" + dataIndex + "].weight"));
        assertEquals(exchange, repJP.getInt("[" + dataIndex + "].exchange"));
        assertEquals(created_at, repJP.getString("[" + dataIndex + "].created_at"));
        assertEquals(updated_at, repJP.getString("[" + dataIndex + "].updated_at"));
    }
    // ********************************************************************************************************************

    // ***************************************** api/pickuprequest/express ************************************************
    @Given("The api user verifies the information in the response body for the entry with the specified {int} index, including {string}, {int}, {string}, {int}, {string}, {string}, {int}, {string} and {string}.")
    public void the_api_user_verifies_the_information_in_the_response_body_for_the_entry_with_the_specified_index_including_and(int dataIndex, String request_type, int merchant_id, String address, int parcel_quantity, String name, String phone, int exchange, String created_at, String updated_at) {
        repJP = response.jsonPath();

        assertEquals(request_type, repJP.getString("[" + dataIndex + "].request_type"));
        assertEquals(merchant_id, repJP.getInt("[" + dataIndex + "].merchant_id"));
        assertEquals(address, repJP.getString("[" + dataIndex + "].address"));
        assertNull(repJP.get("[" + dataIndex + "].note"));
        assertEquals(parcel_quantity, repJP.getInt("[" + dataIndex + "].parcel_quantity"));
        assertEquals(name, repJP.getString("[" + dataIndex + "].name"));
        assertEquals(phone, repJP.getString("[" + dataIndex + "].phone"));
        assertNull(repJP.get("[" + dataIndex + "].cod_amount"));
        assertNull(repJP.get("[" + dataIndex + "].invoice"));
        assertNull(repJP.get("[" + dataIndex + "].weight"));
        assertEquals(exchange, repJP.getInt("[" + dataIndex + "].exchange"));
        assertEquals(created_at, repJP.getString("[" + dataIndex + "].created_at"));
        assertEquals(updated_at, repJP.getString("[" + dataIndex + "].updated_at"));
    }
    // ********************************************************************************************************************

    // ****************************************** api/pickuprequest/{id} **************************************************
    @Given("The api user verifies that the data in the response body includes {int}, {string}, {int}, {string}, {string}, {int}, {string}, {string}, {string}, {string}, {int}, {int}, {string} and {string}.")
    public void the_api_user_verifies_that_the_data_in_the_response_body_includes_and(int id, String request_type, int merchant_id, String address, String note, int parcel_quantity, String name, String phone, String cod_amount, String invoice, int weight, int exchange, String created_at, String updated_at) {
        map = response.as(HashMap.class);

        assertEquals(id, map.get("id"));
        assertEquals(request_type, map.get("request_type"));
        assertEquals(merchant_id, map.get("merchant_id"));
        assertEquals(address, map.get("address"));
        assertEquals(note, map.get("note"));
        assertEquals(parcel_quantity, map.get("parcel_quantity"));
        assertEquals(name, map.get("name"));
        assertEquals(phone, map.get("phone"));
        assertEquals(cod_amount, map.get("cod_amount"));
        assertEquals(invoice, map.get("invoice"));
        assertEquals(weight, map.get("weight"));
        assertEquals(exchange, map.get("exchange"));
        assertEquals(created_at, map.get("created_at"));
        assertEquals(updated_at, map.get("updated_at"));
    }
    // ********************************************************************************************************************

    // ***************************************** api/merchantrequest/{id} *************************************************
    @Given("The api user verifies the information in the response body for the entry with the specified {int} index, including {string}, {int}, {string}, {string}, {int}, {string}, {string}, {string}, {string}, {int}, {int}, {string} and {string}.")
    public void the_api_user_verifies_the_information_in_the_response_body_for_the_entry_with_the_specified_index_including_and(int dataIndex, String request_type, int merchant_id, String address, String note, int parcel_quantity, String name, String phone, String cod_amount, String invoice, int weight, int exchange, String created_at, String updated_at) {
        repJP = response.jsonPath();

        assertEquals(request_type, repJP.getString("[" + dataIndex + "].request_type"));
        assertEquals(merchant_id, repJP.getInt("[" + dataIndex + "].merchant_id"));
        assertEquals(address, repJP.getString("[" + dataIndex + "].address"));
        assertEquals(note, repJP.getString("[" + dataIndex + "].note"));
        assertEquals(parcel_quantity, repJP.getInt("[" + dataIndex + "].parcel_quantity"));
        assertEquals(name, repJP.getString("[" + dataIndex + "].name"));
        assertEquals(phone, repJP.getString("[" + dataIndex + "].phone"));
        assertEquals(cod_amount, repJP.getString("[" + dataIndex + "].cod_amount"));
        assertEquals(invoice, repJP.getString("[" + dataIndex + "].invoice"));
        assertEquals(weight, repJP.getInt("[" + dataIndex + "].weight"));
        assertEquals(exchange, repJP.getInt("[" + dataIndex + "].exchange"));
        assertEquals(created_at, repJP.getString("[" + dataIndex + "].created_at"));
        assertEquals(updated_at, repJP.getString("[" + dataIndex + "].updated_at"));
    }
    // ********************************************************************************************************************

    // ******************************************* api/pickuprequest/regular/add ******************************************
    @Given("The api user prepares a POST request containing {string} and {int} information to send to the api regularadd endpoint.")
    public void the_api_user_prepares_a_post_request_containing_and_information_to_send_to_the_api_regularadd_endpoint(String note, int parcel_quantity) {
        requestBody = builder
                .addParameterForJSONObject("note", note)
                .addParameterForJSONObject("parcel_quantity", parcel_quantity)
                .buildUsingJSONObject();

        System.out.println("POST Request Body : " + requestBody);
    }

    @Given("The api user prepares a POST request containing {int}, {string} and {int} information to send to the api regularadd endpoint.")
    public void the_api_user_prepares_a_post_request_containing_and_information_to_send_to_the_api_regularadd_endpoint(int merchant_id, String note, int parcel_quantity) {
        requestBody = builder
                .addParameterForJSONObject("merchant_id", merchant_id)
                .addParameterForJSONObject("note", note)
                .addParameterForJSONObject("parcel_quantity", parcel_quantity)
                .buildUsingJSONObject();

        System.out.println("POST Request Body : " + requestBody);
    }
    // ********************************************************************************************************************

    // ******************************************* api/pickuprequest/express/add ******************************************
    @Given("The api user prepares a POST request containing {int}, {string}, {string} and {string} information to send to the api expressadd endpoint.")
    public void the_api_user_prepares_a_post_request_containing_and_information_to_send_to_the_api_expressadd_endpoint(int merchant_id, String address, String name, String phone) {
        requestBody = builder
                .addParameterForMap("merchant_id", merchant_id)
                .addParameterForMap("address", address)
                .addParameterForMap("name", name)
                .addParameterForMap("phone", phone)
                .buildUsingMap();

        System.out.println("POST Request Body : " + requestBody);
    }
    // ********************************************************************************************************************

    // **************************************** api/pickuprequest/regular/edit/{id} ***************************************
    @Given("The api user prepares a PATCH request containing {string} and {int} information to send to the api regularedit endpoint.")
    public void the_api_user_prepares_a_patch_request_containing_and_information_to_send_to_the_api_regularedit_endpoint(String note, int parcel_quantity) {
        requestBody = builder
                .addParameterForMap("note", note)
                .addParameterForMap("parcel_quantity", parcel_quantity)
                .buildUsingMap();

        System.out.println("PATCH Request Body : " + requestBody);
    }
    // ********************************************************************************************************************

    // **************************************** api/pickuprequest/express/edit/{id} ***************************************
    @Given("The api user prepares a PATCH request containing {string}, {string} and {string} information to send to the api expressedit endpoint.")
    public void the_api_user_prepares_a_patch_request_containing_and_information_to_send_to_the_api_expressedit_endpoint(String address, String note, String name) {
        requestBody = builder
                .addParameterForMap("address", address)
                .addParameterForMap("note", note)
                .addParameterForMap("name", name)
                .buildUsingMap();

        System.out.println("PATCH Request Body : " + requestBody);
    }
    // ********************************************************************************************************************

    // ************************************************* api/packaging/list ***********************************************
    @Given("The api user verifies the information in the response body for the entry with the specified {int} index, including {string}, {string}, {int}, {string}, {string} and {string}.")
    public void the_api_user_verifies_the_information_in_the_response_body_for_the_entry_with_the_specified_index_including_and(int dataIndex, String name, String price, int status, String position, String created_at, String updated_at) {
        repJP = response.jsonPath();

        assertEquals(name, repJP.getString("data[" + dataIndex + "].name"));
        assertEquals(price, repJP.getString("data[" + dataIndex + "].price"));
        assertEquals(status, repJP.getInt("data[" + dataIndex + "].status"));
        assertEquals(position, repJP.getString("data[" + dataIndex + "].position"));
        assertNull(repJP.get("data[" + dataIndex + "].photo"));
        assertEquals(created_at, repJP.getString("data[" + dataIndex + "].created_at"));
        assertEquals(updated_at, repJP.getString("data[" + dataIndex + "].updated_at"));
    }
    // ********************************************************************************************************************

    // ************************************************* api/packaging/{id} ***********************************************
    @Given("The api user verifies that the data in the response body includes {int}, {string}, {string}, {int}, {string}, {string} and {string}.")
    public void the_api_user_verifies_that_the_data_in_the_response_body_includes_and(int id, String name, String price, int status, String position, String created_at, String updated_at) {
        repJP = response.jsonPath();

        assertEquals(name, repJP.getString("name"));
        assertEquals(price, repJP.getString("price"));
        assertEquals(status, repJP.getInt("status"));
        assertEquals(position, repJP.getString("position"));
        assertNull(repJP.get("photo"));
        assertEquals(created_at, repJP.getString("created_at"));
        assertEquals(updated_at, repJP.getString("updated_at"));
    }
    // ********************************************************************************************************************

    // ************************************************* api/packaging/add ************************************************
    @Given("The api user prepares a POST request containing {string}, {int} and {string} information to send to the api packagingdd endpoint.")
    public void the_api_user_prepares_a_post_request_containing_and_information_to_send_to_the_api_packagingdd_endpoint(String name, int status, String position) {
        requestBody = builder
                .addParameterForJSONObject("name", name)
                .addParameterForJSONObject("status", status)
                .addParameterForJSONObject("position", position)
                .buildUsingJSONObject();

        System.out.println("POST Request Body : " + requestBody);
    }
    // ********************************************************************************************************************

    // ******************************************** api/packaging/edit/{id} ***********************************************
    @Given("The api user prepares a PATCH request containing {string} and {string} information to send to the api packagingedit endpoint.")
    public void the_api_user_prepares_a_patch_request_containing_and_information_to_send_to_the_api_packagingedit_endpoint(String name, String price) {
        PackagingPojo packagingPojo = new PackagingPojo(name, price);
        requestBody = gson.toJson(packagingPojo);

        System.out.println("PATCH Request Body : " + requestBody);
    }
    // ********************************************************************************************************************

    // ********************************************** api/blog/list *******************************************************
    @Given("The api user verifies the information in the response body for the entry with the specified {int} index, including {string}, {int}, {string}, {string}, {int}, {int}, {string}, {string} and {string}.")
    public void the_api_user_verifies_the_information_in_the_response_body_for_the_entry_with_the_specified_index_including_and(int dataIndex, String title, int image_id, String description, String position, int status, int created_by, String views, String created_at, String updated_at) {
        response
                .then()
                .assertThat()
                .body("[" + dataIndex + "].title", containsString(title),
                        "[" + dataIndex + "].image_id", equalTo(image_id),
                        "[" + dataIndex + "].description", containsString(description),
                        "[" + dataIndex + "].position", equalTo(position),
                        "[" + dataIndex + "].status", equalTo(status),
                        "[" + dataIndex + "].created_by", equalTo(created_by),
                        "[" + dataIndex + "].views", equalTo(views),
                        "[" + dataIndex + "].created_at", equalTo(created_at),
                        "[" + dataIndex + "].updated_at", equalTo(updated_at));
    }
    // ********************************************************************************************************************

    // ********************************************** api/blog/last *******************************************************
    @Given("The api user verifies the information in the response body for the entry with the specified {int} index, including {string}, {string}, {string}, {int}, {int}, {string}, {string} and {string}.")
    public void the_api_user_verifies_the_information_in_the_response_body_for_the_entry_with_the_specified_index_including_and(int dataIndex, String title, String description, String position, int status, int created_by, String views, String created_at, String updated_at) {
        response
                .then()
                .assertThat()
                .body("[" + dataIndex + "].title", equalTo(title),
                        "[" + dataIndex + "].description", equalTo(description),
                        "[" + dataIndex + "].position", equalTo(position),
                        "[" + dataIndex + "].status", equalTo(status),
                        "[" + dataIndex + "].created_by", equalTo(created_by),
                        "[" + dataIndex + "].views", equalTo(views),
                        "[" + dataIndex + "].created_at", equalTo(created_at),
                        "[" + dataIndex + "].updated_at", equalTo(updated_at));
    }
    // ********************************************************************************************************************

    // ********************************************** api/blog/{id} *******************************************************
    @Given("The api user verifies that the data in the response body includes {int}, {string}, {int}, {string}, {string}, {int}, {int}, {string}, {string} and {string}.")
    public void the_api_user_verifies_that_the_data_in_the_response_body_includes_and(int id, String title, int image_id, String description, String position, int status, int created_by, String views, String created_at, String updated_at) {
        map = response.as(HashMap.class);

        String actualTitle = (String) map.get("title");
        String actualDescription = (String) map.get("description");

        assertEquals(id, map.get("id"));
        assertTrue(actualTitle.contains(title));
        assertEquals(image_id, map.get("image_id"));
        assertTrue(actualDescription.contains(description));
        assertEquals(position, map.get("position"));
        assertEquals(status, map.get("status"));
        assertEquals(created_by, map.get("created_by"));
        assertEquals(views, map.get("views"));
        assertEquals(created_at, map.get("created_at"));
        assertEquals(updated_at, map.get("updated_at"));
    }
    // ********************************************************************************************************************

    // ******************************************* api/blog/edit/{id} *****************************************************
    @Given("The api user prepares a PATCH request containing {string}, {string}, {string} and {string} information to send to the api blogedit endpoint.")
    public void the_api_user_prepares_a_patch_request_containing_and_information_to_send_to_the_api_blogedit_endpoint(String title, String description, String position, String status) {
        requestBody = builder
                .addParameterForJSONObject("title", title)
                .addParameterForJSONObject("description", description)
                .addParameterForJSONObject("position", position)
                .addParameterForJSONObject("status", status)
                .buildUsingJSONObject();

        System.out.println("PATCH Request Body : " + requestBody);
    }
    // ********************************************************************************************************************

    // ********************************************** api/ticket/list *****************************************************
    @Given("The api user verifies the information in the response body for the entry with the specified {int} index, including {int}, {int}, {string}, {string}, {string}, {string}, {string}, {int}, {string} and {string}.")
    public void the_api_user_verifies_the_information_in_the_response_body_for_the_entry_with_the_specified_index_including_and(int dataIndex, int user_id, int department_id, String service, String priority, String subject, String description, String date, int status, String created_at, String updated_at) {
        repJP = response.jsonPath();

        assertEquals(user_id, repJP.getInt("[" + dataIndex + "].user_id"));
        assertEquals(department_id, repJP.getInt("[" + dataIndex + "].department_id"));
        assertEquals(service, repJP.getString("[" + dataIndex + "].service"));
        assertEquals(priority, repJP.getString("[" + dataIndex + "].priority"));
        assertEquals(subject, repJP.getString("[" + dataIndex + "].subject"));
        assertTrue(repJP.getString("[" + dataIndex + "].description").contains(description));
        assertEquals(date, repJP.getString("[" + dataIndex + "].date"));
        assertNull(repJP.get("[" + dataIndex + "].attached_file"));
        assertEquals(status, repJP.getInt("[" + dataIndex + "].status"));
        assertEquals(created_at, repJP.getString("[" + dataIndex + "].created_at"));
        assertEquals(updated_at, repJP.getString("[" + dataIndex + "].updated_at"));
    }
    // ********************************************************************************************************************

    // ********************************************** api/ticket/{id} *****************************************************
    @Given("The api user verifies that the data in the response body includes {int}, {int}, {int}, {string}, {string}, {string}, {string}, {string}, {int}, {string} and {string}.")
    public void the_api_user_verifies_that_the_data_in_the_response_body_includes_and(int id, int user_id, int department_id, String service, String priority, String subject, String description, String date, int status, String created_at, String updated_at) {
        TicketPojo ticketPojo = new TicketPojo(id, user_id, department_id, service, priority, subject, description, date, null, status, created_at, updated_at);

        assertEquals(id, ticketPojo.getId());
        assertEquals(user_id, ticketPojo.getUserId());
        assertEquals(department_id, ticketPojo.getDepartmentId());
        assertEquals(service, ticketPojo.getService());
        assertEquals(priority, ticketPojo.getPriority());
        assertEquals(subject, ticketPojo.getSubject());
        assertTrue(ticketPojo.getDescription().contains(description));
        assertEquals(date, ticketPojo.getDate());
        assertNull(ticketPojo.getAttachedFile());
        assertEquals(status, ticketPojo.getStatus());
        assertEquals(created_at, ticketPojo.getCreatedAt());
        assertEquals(updated_at, ticketPojo.getUpdatedAt());
    }
    // ********************************************************************************************************************

    // **************************************** api/ticket/status-update/{id} *********************************************
    @Given("The api user prepares a GET request containing {int} information to send to the api ticketedit endpoint.")
    public void the_api_user_prepares_a_get_request_containing_information_to_send_to_the_api_ticketedit_endpoint(int status) {
        requestBody = builder
                .addParameterForMap("status", status)
                .buildUsingMap();

        System.out.println("PATCH Request Body : " + requestBody);
    }

    @Given("The api user verifies that status is {int}.")
    public void the_api_user_verifies_that_status_is(int status) {
        response
                .then()
                .assertThat()
                .body("status", equalTo(status));
    }
    // ********************************************************************************************************************

    // ********************************************* api/ticket/edit/{id} *************************************************
    @Given("The api user prepares a PATCH request containing {int}, {string}, {string}, {string}, {string} and {string} information to send to the api ticketedit endpoint.")
    public void the_api_user_prepares_a_patch_request_containing_and_information_to_send_to_the_api_ticketedit_endpoint(int department_id, String service, String priority, String subject, String description, String date) {
        requestBody = builder
                .addParameterForJSONObject("department_id", department_id)
                .addParameterForJSONObject("service", service)
                .addParameterForJSONObject("priority", priority)
                .addParameterForJSONObject("subject", subject)
                .addParameterForJSONObject("description", description)
                .addParameterForJSONObject("date", date)
                .buildUsingJSONObject();

        System.out.println("PATCH Request Body : " + requestBody);
    }
    // ********************************************************************************************************************

    // ********************************************* api/todo/list *******************************************************
    @Given("The api user verifies the information in the response body for the entry with the specified {int} index, including {string}, {string}, {int}, {string}, {int}, {string} and {string}.")
    public void the_api_user_verifies_the_information_in_the_response_body_for_the_entry_with_the_specified_index_including_and(int dataIndex, String title, String description, int user_id, String date, int status, String created_at, String updated_at) {
        repJP = response.jsonPath();

        assertEquals(title, repJP.getString("[" + dataIndex + "].title"));
        assertEquals(description, repJP.getString("[" + dataIndex + "].description"));
        assertEquals(user_id, repJP.getInt("[" + dataIndex + "].user_id"));
        assertEquals(date, repJP.getString("[" + dataIndex + "].date"));
        assertEquals(status, repJP.getInt("[" + dataIndex + "].status"));
        assertNull(repJP.get("[" + dataIndex + "].note"));
        assertEquals(created_at, repJP.getString("[" + dataIndex + "].created_at"));
        assertEquals(updated_at, repJP.getString("[" + dataIndex + "].updated_at"));
    }
    // ********************************************************************************************************************

    // ********************************************* api/todo/{id} *******************************************************
    @Given("The api user verifies that the data in the response body includes {int}, {string}, {string}, {int}, {string}, {int}, {string} and {string}.")
    public void the_api_user_verifies_that_the_data_in_the_response_body_includes_and(int id, String title, String description, int user_id, String date, int status, String created_at, String updated_at) {
        map = response.as(HashMap.class);

        assertEquals(id, map.get("id"));
        assertEquals(title, map.get("title"));
        assertEquals(description, map.get("description"));
        assertEquals(user_id, map.get("user_id"));
        assertEquals(date, map.get("date"));
        assertEquals(status, map.get("status"));
        assertNull(map.get("note"));
        assertEquals(created_at, map.get("created_at"));
        assertEquals(updated_at, map.get("updated_at"));
    }
    // ********************************************************************************************************************


}
