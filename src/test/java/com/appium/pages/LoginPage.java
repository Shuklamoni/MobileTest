package com.appium.pages;

public class LoginPage extends BasePage {

    public void selectCountryCode(String country, String countryCode) {
        this.clickOnButtonInText("+1");
        this.enter("Search country code...", country);
        this.clickOnButtonInText(countryCode);
    }

    public void enterMobileNumber(String fieldName, String phoneNumber) {
        this.enter(fieldName, phoneNumber);
    }

    public void selectContinueWithUsernameOrEmail(String option) {
        this.clickOnButtonInText(option);

    }

    public void enterEmail(String fieldName, String email) {
        this.enter(fieldName,email);
    }




}