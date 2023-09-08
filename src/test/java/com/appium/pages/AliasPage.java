package com.appium.pages;

public class AliasPage extends BasePage {


    public void enterAlias(String fieldName, String phoneNumber) {
        this.enter(fieldName, phoneNumber);
    }
    public void selectSetUsernameOption(String option) {
        this.clickOnButtonInText(option);

    }

}
