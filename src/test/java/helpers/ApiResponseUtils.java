package helpers;
import static io.restassured.RestAssured.*;
import io.restassured.response.Response;


public class ApiResponseUtils {
    public ApiResponseUtils() {
        // Set the base URI for your API endpoints
        baseURI = ""; // need to add base url
    }

    public Response sendGetRequest(String endpoint) {
        return get(endpoint);
    }

    public Response sendPostRequest(String endpoint, String requestBody) {
        return given()
                .contentType(ContentType.JSON)
                .body(requestBody)
                .when()
                .post(endpoint);
    }


}
