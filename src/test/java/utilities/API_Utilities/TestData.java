package utilities.API_Utilities;

import java.util.HashMap;

public class TestData {
    HashMap<String, HashMap<String, Object>> reqBody = new HashMap<>();

<<<<<<< HEAD
    Faker faker = new Faker();

=======
>>>>>>> 443bf2bef0173de9322f7e13a242249b312f6dc3
    public HashMap hubRequestBody() {

        HashMap<String, Object> requestBody = new HashMap<>();

        requestBody.put("name", "Test Hub");
        requestBody.put("phone", "01000000004");
        requestBody.put("address", "Houston, Texas");

        return requestBody;
    }

    public HashMap requestBody(String folder) {

        reqBody.put("hub", hubRequestBody());

        return reqBody.get(folder);
    }
}
