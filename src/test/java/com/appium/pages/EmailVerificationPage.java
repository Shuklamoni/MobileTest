package com.appium.pages;

public class EmailVerificationPage extends BasePage {

    public void enterOtp(String fieldName, String otp) {
        this.enter(fieldName, otp);
    }

    public void selectTryAnotherWayOption(String option) {
        this.clickOnButtonInText(option);
    }
    public void selectContactUsOption(String option) {
        this.clickOnButtonInText(option);
    }



}
