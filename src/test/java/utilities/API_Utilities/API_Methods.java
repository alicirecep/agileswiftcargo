package utilities.API_Utilities;

import base.BaseTest;
import io.cucumber.java.Before;
import io.cucumber.java.Scenario;
import io.restassured.builder.RequestSpecBuilder;
import io.restassured.http.ContentType;
import io.restassured.path.json.JsonPath;
import io.restassured.response.Response;

import java.util.Arrays;
import java.util.HashMap;

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

    public static void assertPathParam(String reponseId) {
        repJP = response.jsonPath();
        String idValue = repJP.getString(reponseId);

        int data_id = Integer.parseInt(idValue);

        assertEquals(API_Methods.id, data_id);
    }

    public static void verification(String pp1, String pp2, String idKey, String path, Object value) {
        repJP = response.jsonPath();
        Object idValue = repJP.get(idKey);

        int id = 0;
        if (idValue instanceof String) {
            id = Integer.parseInt((String) idValue);
        } else {
            id = (int) idValue;
        }
        System.out.println(idKey + " : " + id);

        spec = new RequestSpecBuilder().setBaseUri(configLoader.getApiConfig("base_url")).build();
        spec.pathParams("pp1", pp1, "pp2", pp2, "pp3", id);


        response = given()
                .spec(spec)
                .header("Accept", "application/json")
                .header("token", Authentication.generateToken("admin"))
                .when()
                .get("/{pp1}/{pp2}/{pp3}");

        response.then()
                .assertThat()
                .body(path, equalTo(value));
    }

    public static int addedId(String pp2, String folder, String idKey) {

        spec = new RequestSpecBuilder().setBaseUri(configLoader.getApiConfig("base_url")).build();
        spec.pathParams("pp1", "api", "pp2", pp2);
        TestData testData = new TestData();

        HashMap<String, Object> requestBody = testData.requestBody(folder);

        response = given()
                .spec(spec)
                .contentType(ContentType.JSON)
                .header("Accept", "application/json")
                .header("token", Authentication.generateToken("admin"))
                .when()
                .body(requestBody)
                .post("/{pp1}/{pp2}");

        JsonPath repJP = response.jsonPath();

        int id = repJP.getInt(idKey);

        System.out.println(idKey + " : " + id);

        return id;
    }

    public static int addedId;

    @Before(order = 1)
    public void beforePatchOrDelete(Scenario scenario) {
        if (scenario.getSourceTagNames().contains("@Patch") || scenario.getSourceTagNames().contains("@Delete")) {
            String scenarioName = scenario.getName();

            String pp2 = null;
            String folder = null;
            String idKey = null;

            if (scenarioName.contains("BLOG")) {
                pp2 = "addBlog";
                folder = "blog";
                idKey = "data.added_blog_id";
            }

            // ID oluşturma
            addedId = API_Methods.addedId(pp2, folder, idKey);
        }
    }


}
