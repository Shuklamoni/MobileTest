package com.appium.pages;

public class LoginPreferencesPage extends BasePage {

    public void selectVerifyWithSmsOption(String option) {
        this.clickOnButtonInText(option);
    }

    public void selectVerifyWihEmailOption(String option) {
        this.clickOnButtonInText(option);
    }
    public void selectEnterPasswordOption(String option) {
        this.clickOnButtonInText(option);
    }

}
