package utilities.API_Utilities;

import com.google.gson.Gson;
import org.json.JSONObject;

import java.util.HashMap;
import java.util.Map;

public class RequestBuilder {
    private Map<String, Object> mapRequestBody;
    private JSONObject jsonObjectRequestBody;

    public RequestBuilder() {
        this.mapRequestBody = new HashMap<>();
        this.jsonObjectRequestBody = new JSONObject();
    }

    public RequestBuilder addParameterForMap(String key, Object value) {
        this.mapRequestBody.put(key, value);
        return this;
    }

    public RequestBuilder addParameterForJSONObject(String key, Object value) {
        this.jsonObjectRequestBody.put(key, value);
        return this;
    }

    public String buildUsingMap() {
        return new Gson().toJson(this.mapRequestBody);
    }

    public String buildUsingJSONObject() {
        return this.jsonObjectRequestBody.toString();
    }
}
