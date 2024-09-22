package base;

import config_Requirements.ConfigLoader;
import config_Requirements.ExcelDataReader;
import io.restassured.path.json.JsonPath;
import io.restassured.response.Response;

public abstract class BaseTest {

    protected static ConfigLoader configLoader;
    protected static ExcelDataReader excelData;

    protected static JsonPath repJP;
    protected static Response response;

    public BaseTest() {
        configLoader = new ConfigLoader();
        excelData = new ExcelDataReader("src/test/resources/testData/testData.xlsx", "Data");
    }
}
