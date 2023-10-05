package com.appium.pages;

import org.openqa.selenium.By;

public class SignUpWithPhonePage extends BasePage {

    public void selectCountryCode(String country, String countryCode) {
        this.clickOnButtonInText("+1");
        this.enter("Search country code...", country);
        this.clickOnButtonInText(countryCode);
    }

    public void enterMobileNumber(String fieldName, String phoneNumber) {
        this.enter(fieldName, phoneNumber);
    }

    public void selectEmail(String option) {
        this.clickOnButtonInText(option);

    }

    public boolean isDefaultCountryCodeMy(String locator, String value, int timeoutInSeconds){
        Boolean myisDefaultCountry = false;
        if (this.isDisplayed(locator,value,timeoutInSeconds))
            myisDefaultCountry = true;

        return myisDefaultCountry;
    }

    public void  selectCountryCodeOption(String option){
        this.clickOnButtonInText(option);

    }

    public Boolean isTicMarkPresent(){
        String locator = null; String value = null; int timeoutInSeconds = 0;
        return this.isDisplayed(locator,value,timeoutInSeconds);
    }

    public Boolean isSetCourseEnabled(String locator){
           return this.isButtonEnabled(locator);
    }

    public String inlineErrorMessage(){
        By option ;
        String text;
      return this.getText(option,text);
    }


}