package com.appium.pages;

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

    public void selectLogIn(String option) {
        this.clickOnButtonInText(option);
    }

    public boolean isWelcomeScreen(MobileElment elementName,int time){


    }

}
