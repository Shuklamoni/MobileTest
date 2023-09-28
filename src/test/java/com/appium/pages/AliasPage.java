package com.appium.pages;

public class AliasPage extends BasePage {


    public void enterAlias( String aliasName) {
        String fieldName ;
        this.enter(fieldName, aliasName);
    }
    public void selectSetUsernameOption(String option) {
        this.clickOnButtonInText(option);

    }
    public Boolean isSetUsernameEnabled(String locator){
        return this.isButtonEnabled(locator);
    }

    public void tapOnSetUsername(String locator){
        this.clickOnButtonInText(locator);
    }

}
