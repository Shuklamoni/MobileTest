package com.appium.pages;

public class SecureLoginPage extends BasePage{




        public void enterPassword(String fieldName, String otp) {
            this.enter(fieldName, otp);
        }

    public void selectTryAnotherWayOption(String option) {
        this.clickOnButtonInText(option);
    }
    public void selectContactUsOption(String option) {
        this.clickOnButtonInText(option);
    }

    public void selectLogInOption(String option) {
        this.clickOnButtonInText(option);
    }


}
