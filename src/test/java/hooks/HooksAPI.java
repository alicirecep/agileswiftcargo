package hooks;

import io.cucumber.java.After;
import io.cucumber.java.Before;
import io.cucumber.java.Scenario;
import io.restassured.builder.RequestSpecBuilder;
import io.restassured.specification.RequestSpecification;
import utilities.API_Utilities.Authentication;
import base.BaseTest;

public class HooksAPI extends BaseTest {
    public static RequestSpecification spec;

    public static boolean setupApiCompleted = false;

    @Before(order = 2)
    public void setUpScenario(Scenario scenario) {
        String token = null;

        // Senaryonun adına göre belirleniyor
        if (scenario.getName().contains("Invalid Token")) {
            token = configLoader.getApiConfig("invalidToken"); // Geçersiz token al
            setupApiCompleted = true;
        } else {
            if (scenario.getName().contains("admin") || scenario.getName().contains("merchant") || scenario.getName().contains("deliveryman")) {
                token = Authentication.generateToken(scenario.getName().split(" ")[0]);
            }
        }

        spec = new RequestSpecBuilder()
                .setBaseUri(configLoader.getApiConfig("base_url"))
                .addHeader("Accept", "application/json")
                .addHeader("Authorization", "Bearer " + token)
                .build();

        setupApiCompleted = true;
    }

    @After
    public void tearDownScenarios(Scenario scenario) {
        if (scenario.isFailed()) {  // Senaryo başarısız olursa
            logFailure(scenario);
        }
    }

    private void logFailure(Scenario scenario) {
        String scenarioName = scenario.getName();
        String scenarioStatus = scenario.getStatus().name();

        // Kendi loglama method'unu kullanarak bilgileri yazdırma
        System.out.println("Senaryo Adi: " + scenarioName);
        System.out.println("Durum: " + scenarioStatus);
    }
}


