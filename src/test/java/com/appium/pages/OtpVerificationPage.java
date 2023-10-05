package com.appium.pages;

import helpers.ApiResponseUtils;
import org.openqa.selenium.remote.Response;

public class OtpVerificationPage extends BasePage{

    ApiResponseUtils apiutils = new ApiResponseUtils();

    public void enterOtp( String otp) {
        String fieldName = null;    
        this.enter(fieldName, otp);
        }

    public Response fetchOtp() {
        return apiutils.sendGetRequest(""); //api nedds to be added
    }





}
