package com.appium.pages;

import javax.swing.*;

public class WelcomePage extends BasePage {

    public void selectSignUpWithAccount(String option) {
        this.clickOnButtonInText(option);
        }

    public void selectContinueWithWallet(String option) {
        this.clickOnButtonInText(option);
    }

    public void selectContinueWithApple(String option) {
        this.clickOnButtonInText(option);
    }
    public void selectContinueWithGoogle(String option) {
        this.clickOnButtonInText(option);
    }

    public void selectLogin() {
        this.clickOnButtonInText(option);
    }

    public boolean isWelcomeScreen(){
        String buttonName = null;
        return  this.iselementContainsTextDisplayed(buttonName);

    }

}
