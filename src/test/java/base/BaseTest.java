package base;

import config_Requirements.ConfigLoader;
import config_Requirements.ExcelDataReader;
import io.restassured.path.json.JsonPath;
import io.restassured.response.Response;
import org.json.JSONObject;
import utilities.API_Utilities.RequestBuilder;
import utilities.API_Utilities.TestData;

import java.util.HashMap;

import java.util.HashMap;

public abstract class BaseTest {

    protected static ConfigLoader configLoader;
    protected static ExcelDataReader excelData;

    protected static JsonPath repJP;
    protected static Response response;
    protected static HashMap map;

    protected static TestData testData;

    protected JSONObject requestBody;
    protected RequestBuilder builder;

    public BaseTest() {
        builder = new RequestBuilder();
        requestBody = new JSONObject();
        map = new HashMap<>();
        testData = new TestData();
        configLoader = new ConfigLoader();
        excelData = new ExcelDataReader("src/test/resources/testData/testData.xlsx", "Data");
    }
}
