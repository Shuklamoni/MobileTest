package com.appium.pages;

/**
 * @author Qianmin Yan
 * @date Jul 22 2022
 */
public class AuthPage extends BasePage {

    public void selectCountryCode(String country, String countryCode) {
        this.clickOnButtonInText("+1");
        this.enter("Search country code...",country );
        this.clickOnButtonInText(countryCode);
    }
}