package utilities.API_Utilities;

import java.util.HashMap;

public class TestData {
    HashMap<String, HashMap<String, Object>> reqBody = new HashMap<>();

    public HashMap hubRequestBody() {

        HashMap<String, Object> requestBody = new HashMap<>();

        requestBody.put("name", "Test Hub");
        requestBody.put("phone", "01000000004");
        requestBody.put("address", "Houston, Texas");

        return requestBody;
    }

    public HashMap parcelRequestBody() {

        HashMap<String, Object> requestBody = new HashMap<>();

        requestBody.put("merchant_id", 2);
        requestBody.put("merchant_shop_id", 6);
        requestBody.put("category_id", 1);
        requestBody.put("delivery_type_id", 1);
        requestBody.put("customer_name", "John Due");
        requestBody.put("customer_phone", "145879632147");
        requestBody.put("customer_address", "318 WARREN ST, Brooklyn, NY 11206");

        return requestBody;
    }

    public HashMap requestBody(String folder) {

        reqBody.put("hub", hubRequestBody());
        reqBody.put("parcel", parcelRequestBody());

        return reqBody.get(folder);
    }

}
