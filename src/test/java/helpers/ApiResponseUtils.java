package helpers;
import static io.restassured.RestAssured.*;
import restassured.response.Response;


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

    public Response sendGetRequestWithPathParameter(String endpoint, String pathParam) {
        String requestUrl = baseURI + endpoint + "/" + pathParam;

        Response response =
                given()
                        .when()
                        .get(requestUrl);

        return response;
    }

    public Response sendPutRequestWithPathParameter(String endpoint, String pathParam, String requestBody) {
        String requestUrl = baseURI + endpoint + "/" + pathParam;

        Response response =
                given()
                        .contentType(ContentType.JSON)
                        .body(requestBody)
                        .when()
                        .put(requestUrl);

        return response;
    }

    public Response sendPatchRequestWithPathParameter(String endpoint, String pathParam, String requestBody) {
        String requestUrl = baseURI + endpoint + "/" + pathParam;

        Response response =
                given()
                        .contentType(ContentType.JSON)
                        .body(requestBody)
                        .when()
                        .patch(requestUrl);

        return response;
    }

}
