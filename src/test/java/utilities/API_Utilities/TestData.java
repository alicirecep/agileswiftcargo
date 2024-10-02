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

    public HashMap deliverymanRequestBody() {

        HashMap<String, Object> requestBody = new HashMap<>();

        requestBody.put("name", "Delivery Man 258");
        requestBody.put("mobile", "12589634780");
        requestBody.put("email", "deliveryman@deliveryman.com");
        requestBody.put("password", "123123");
        requestBody.put("address", "New York City");
        requestBody.put("hub_id", 1);
        requestBody.put("status", 1);

        return requestBody;
    }

    public HashMap merchantRequestBody() {

        HashMap<String, Object> requestBody = new HashMap<>();

        requestBody.put("name", "Merchant Test");
        requestBody.put("business_name", "Firm AŞ");
        requestBody.put("mobile", "11111111111");
        requestBody.put("email", "merchantfirm@gmail.com");
        requestBody.put("password", "123123123");
        requestBody.put("address", "Houston");
        requestBody.put("hub_id", 1);
        requestBody.put("status", 1);

        return requestBody;
    }

    public HashMap shopRequestBody() {

        HashMap<String, Object> requestBody = new HashMap<>();

        requestBody.put("merchant_id", 8);
        requestBody.put("name", "Prof Cargo");
        requestBody.put("contact_no", "33358975556");
        requestBody.put("address", "New York");
        requestBody.put("status", 1);

        return requestBody;
    }

    public HashMap regularRequestBody() {

        HashMap<String, Object> requestBody = new HashMap<>();

        requestBody.put("merchant_id", 2);
        requestBody.put("note", "Note....");
        requestBody.put("parcel_quantity", 5);

        return requestBody;
    }

    public HashMap expressRequestBody() {

        HashMap<String, Object> requestBody = new HashMap<>();

        requestBody.put("merchant_id", 2);
        requestBody.put("address", "Arizona");
        requestBody.put("name", "Test Express Pickup Request 2");
        requestBody.put("phone", "14785236987");

        return requestBody;
    }

    public HashMap packagingRequestBody() {

        HashMap<String, Object> requestBody = new HashMap<>();

        requestBody.put("name", "Gift Box");
        requestBody.put("price", "50.00");
        requestBody.put("status", 1);
        requestBody.put("position", "5");

        return requestBody;
    }

    public HashMap blogRequestBody() {

        HashMap<String, Object> requestBody = new HashMap<>();

        requestBody.put("title", "Blog 35");
        requestBody.put("description", "The rapid growth of e-commerce has reshaped the retail landscape and revolutionized consumer behavior.");
        requestBody.put("position", "5");
        requestBody.put("status", 1);

        return requestBody;
    }

    public HashMap ticketRequestBody() {

        HashMap<String, Object> requestBody = new HashMap<>();

        requestBody.put("department_id", 4);
        requestBody.put("service", "finans");
        requestBody.put("priority", "low");
        requestBody.put("subject", "ticket2");
        requestBody.put("description", "finans ticket");
        requestBody.put("date", "2023-08-23");

        return requestBody;
    }

    public HashMap todoRequestBody() {

        HashMap<String, Object> requestBody = new HashMap<>();

        requestBody.put("title", "Test");
        requestBody.put("description", "Task5");
        requestBody.put("user_id", 3);
        requestBody.put("date", "2023-08-28");

        return requestBody;
    }

    public HashMap requestBody(String folder) {

        reqBody.put("hub", hubRequestBody());
        reqBody.put("parcel", parcelRequestBody());
        reqBody.put("deliveryman", deliverymanRequestBody());
        reqBody.put("merchant", merchantRequestBody());
        reqBody.put("shop", shopRequestBody());
        reqBody.put("regular", regularRequestBody());
        reqBody.put("express", expressRequestBody());
        reqBody.put("packaging", packagingRequestBody());
        reqBody.put("blog", blogRequestBody());
        reqBody.put("ticket", ticketRequestBody());
        reqBody.put("todo", todoRequestBody());

        return reqBody.get(folder);
    }

}
