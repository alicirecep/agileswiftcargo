package utilities.API_Utilities;

import base.BaseTest;
import io.cucumber.java.Before;
import io.cucumber.java.Scenario;
import io.restassured.builder.RequestSpecBuilder;
import io.restassured.http.ContentType;
import io.restassured.response.Response;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static hooks.HooksAPI.spec;
import static io.restassured.RestAssured.given;
import static org.hamcrest.Matchers.equalTo;
import static org.junit.Assert.assertEquals;

public class API_Methods extends BaseTest {
    public static int id;
    public static String fullPath;

    public static void pathParam(String rawPaths) {
        String[] paths = rawPaths.split("/");

        System.out.println(Arrays.toString(paths));

        StringBuilder tempPath = new StringBuilder("/{");


        for (int i = 0; i < paths.length; i++) {

            String key = "pp" + i;
            String value = paths[i].trim();

            spec.pathParam(key, value);

            tempPath.append(key + "}/{");

            if (value.matches("\\d+")) {  // value.matches("\\d+") burada value rakam iceriyorsa dedik
                id = Integer.parseInt(value);
            }
        }
        tempPath.deleteCharAt(tempPath.lastIndexOf("/"));
        tempPath.deleteCharAt(tempPath.lastIndexOf("{"));

        fullPath = tempPath.toString();
        System.out.println("fullPath = " + fullPath);
        System.out.println("id : " + id);
    }

    public static Response sendRequest(String httpMethod, Object requestBody) {

        switch (httpMethod.toUpperCase()) {
            case "GET":
                if (requestBody != null) {
                    response = given()
                            .spec(spec)
                            .contentType(ContentType.JSON)
                            .when()
                            .body(requestBody)
                            .get(fullPath);
                } else {
                    response = given()
                            .spec(spec)
                            .when()
                            .get(fullPath);
                }
                break;
            case "POST":
                response = given()
                        .spec(spec)
                        .contentType(ContentType.JSON)
                        .when()
                        .body(requestBody)
                        .post(fullPath);
                break;
            case "PATCH":
                response = given()
                        .spec(spec)
                        .contentType(ContentType.JSON)
                        .when()
                        .body(requestBody)
                        .patch(fullPath);
                break;
            case "DELETE":
                response = given()
                        .spec(spec)
                        .when()
                        .delete(fullPath);
                break;
        }

        if (response != null) {
            response.prettyPrint();
        }

        return response;
    }


    public static String tryCatchRequest(String httpMethod, Object requestBody) {
        String exceptionMesaj = null;
        try {
            switch (httpMethod.toUpperCase()) {
                case "GET":
                    if (requestBody != null) {
                        response = given()
                                .spec(spec)
                                .contentType(ContentType.JSON)
                                .when()
                                .body(requestBody)
                                .get(fullPath);
                    } else {
                        response = given()
                                .spec(spec)
                                .when()
                                .get(fullPath);
                    }
                    break;
                case "DELETE":
                    response = given()
                            .spec(spec)
                            .when()
                            .delete(fullPath);
                    break;
                case "PATCH":
                    response = given()
                            .spec(spec)
                            .contentType(ContentType.JSON)
                            .when()
                            .body(requestBody)
                            .patch(fullPath);
                    break;
            }
        } catch (Exception e) {
            exceptionMesaj = e.getMessage();
        }
        System.out.println("Exception Mesaj : " + exceptionMesaj);
        return exceptionMesaj;
    }

    public static void statusCodeAssert(int statusCode) {
        response.then()
                .assertThat()
                .statusCode(statusCode);
    }

    public static void assertBody(String path, String value) {
        response.then()
                .assertThat()
                .body(path, equalTo(value));
    }

    public static void assertPathParam(String dataKey, String responseIdKey) {
        map = response.as(HashMap.class);

        Object data = map.get(dataKey);  // "data" alanını elde ediyoruz

        Object idValue = null;

        if (data instanceof List) {
            // Eğer "data" bir dizi ise
            List<Map<String, Object>> dataList = (List<Map<String, Object>>) data;
            idValue = dataList.get(0).get(responseIdKey);

        } else if (data instanceof Map) {
            // Eğer "data" bir obje ise
            Map<String, Object> dataMap = (Map<String, Object>) data;
            idValue = dataMap.get(responseIdKey);
        }

        int id = 0;
        if (idValue instanceof String) {
            id = Integer.parseInt((String) idValue);
        } else {
            id = (Integer) idValue;
        }

        assertEquals(API_Methods.id, id);
    }

    public static void verification(String pp1, String pp2, String dataKey, String responseIdKey, String path, Object value) {
        map = response.as(HashMap.class);

        Object data = map.get(dataKey);  // "data" alanını elde ediyoruz

        Object idValue = null;

        if (data instanceof List) {
            // Eğer "data" bir dizi ise
            List<Map<String, Object>> dataList = (List<Map<String, Object>>) data;
            idValue = dataList.get(0).get(responseIdKey);

        } else if (data instanceof Map) {
            // Eğer "data" bir obje ise
            Map<String, Object> dataMap = (Map<String, Object>) data;
            idValue = dataMap.get(responseIdKey);
        }

        int id = 0;

        if (idValue instanceof String) {
            id = Integer.parseInt((String) idValue);
        } else {
            id = (Integer) idValue;
        }
        System.out.println(responseIdKey + " : " + id);

        spec = new RequestSpecBuilder().setBaseUri(configLoader.getApiConfig("base_url")).build();
        spec.pathParams("pp1", pp1, "pp2", pp2, "pp3", id);


        response = given()
                .spec(spec)
                .header("Accept", "application/json")
                .header("Authorization", "Bearer " + Authentication.generateToken("admin"))
                .when()
                .get("/{pp1}/{pp2}/{pp3}");

        response.then()
                .assertThat()
                .body(path, equalTo(value));
    }

    public static int addedId(String pp2, String pp3, String pp4, String folder, String idKey) {

        spec = new RequestSpecBuilder().setBaseUri(configLoader.getApiConfig("base_url")).build();
        String pathParam = null;
        if (pp4 != null) {
            spec.pathParams("pp1", "api", "pp2", pp2, "pp3", pp3, "pp4", pp4);
            pathParam = "/{pp1}/{pp2}/{pp3}/{pp4}";
        } else {
            spec.pathParams("pp1", "api", "pp2", pp2, "pp3", pp3);
            pathParam = "/{pp1}/{pp2}/{pp3}";
        }

        HashMap<String, Object> requestBody = testData.requestBody(folder);

        response = given()
                .spec(spec)
                .contentType(ContentType.JSON)
                .header("Accept", "application/json")
                .header("Authorization", "Bearer " + Authentication.generateToken("admin"))
                .when()
                .body(requestBody)
                .post(pathParam);

        map = response.as(HashMap.class);

        int id = (int) ((Map) (map.get("data"))).get(idKey);


        System.out.println(idKey + " : " + id);

        return id;
    }

    public static int addedId;

    @Before(order = 1)
    public void beforePatchOrDelete(Scenario scenario) {
        if (scenario.getSourceTagNames().contains("@Patch") || scenario.getSourceTagNames().contains("@Delete")) {
            String scenarioName = scenario.getName();

            String pp2 = null;
            String pp3 = null;
            String pp4 = null;
            String folder = null;
            String idKey = null;

            if (scenarioName.contains("HUB")) {
                pp2 = "hub";
                pp3 = "add";
                folder = "hub";
                idKey = "New Hub ID";
            } else if (scenarioName.contains("PARCEL")) {
                pp2 = "parcel";
                pp3 = "add";
                folder = "parcel";
                idKey = "Parcel ID";
            } else if (scenarioName.contains("DELIVERY")) {
                pp2 = "deliveryman";
                pp3 = "add";
                folder = "deliveryman";
                idKey = "deliveryman id";
            } else if (scenarioName.contains("MERCHANT")) {
                pp2 = "merchant";
                pp3 = "add";
                folder = "merchant";
                idKey = "New Merchant ID";
            } else if (scenarioName.contains("SHOP")) {
                pp2 = "shop";
                pp3 = "add";
                folder = "shop";
                idKey = "New Shop ID";
            } else if (scenarioName.contains("REGULAR")) {
                pp2 = "pickuprequest";
                pp3 = "regular";
                pp4 = "add";
                folder = "regular";
                idKey = "New Pickup Request  ID";
            } else if (scenarioName.contains("EXPRESS")) {
                pp2 = "pickuprequest";
                pp3 = "express";
                pp4 = "add";
                folder = "express";
                idKey = "New Pickup Request  ID";
            } else if (scenarioName.contains("PACKAGING")) {
                pp2 = "packaging";
                pp3 = "add";
                folder = "packaging";
                idKey = "new packaging ID";
            } else if (scenarioName.contains("BLOG")) {
                pp2 = "blog";
                pp3 = "add";
                folder = "blog";
                idKey = "New Blog ID";
            } else if (scenarioName.contains("TICKET")) {
                pp2 = "ticket";
                pp3 = "add";
                folder = "ticket";
                idKey = "New Ticket ID";
            } else if (scenarioName.contains("TODO")) {
                pp2 = "todo";
                pp3 = "add";
                folder = "todo";
                idKey = "New ToDo ID";
            }

            // ID oluşturma
            addedId = API_Methods.addedId(pp2, pp3, pp4, folder, idKey);
        }
    }


}
