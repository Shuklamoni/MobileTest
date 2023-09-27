package com.appium.stepDefinitions.auth;

import com.appium.constants.TestContextConstants;
import com.appium.pages.AuthPage;
import com.appium.pages.LoginPage;
import com.appium.pages.WelcomePage;
import io.cucumber.java.en.And;

import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;

import static com.appium.utils.FileUtils.readTXTFile;
import static org.testng.Assert.assertEquals;
import static org.testng.AssertJUnit.assertTrue;

public class LoginStep {

    AuthPage authPage = new AuthPage();
    WelcomePage welcomePage = new WelcomePage();
    LoginPage loginpage = new LoginPage();
/*
    @When("User click on {string}")
    public void userClickOnLoginButtonInPageFooter(String buttonName) {
            authPage.clickOnButtonInText(buttonName);
    }

    @And("User enter {string} with value {string}")
    public void userEnterWithValue(String fieldName,String value) {
        authPage.enter(fieldName,value);
    }
    @And("User enter {string}")
    public void userEnter(String enterFieldName) {
        String password = readTXTFile(TestContextConstants.RUBYYAN_PASSWORD);
        authPage.enter(enterFieldName,password);
    }
    @Then("User is presented with the toast message {string}")
    @Then("User should be loggedIn/signedUp and see {string} on screen")
    public void userIsAbleToViewProfilePage(String text) {
        assertTrue(authPage.iselementContainsTextDisplayed(text));
    }

    @And("User should see the button {string} is enabled {string}")
    public void loginIsDisabled(String buttonName, String isEnabled) {
        assertEquals( Boolean.parseBoolean(isEnabled),authPage.isButtonEnabled(buttonName));
    }
//
//
//    public void userIsPresentedWithTheToastMessage(String message) {
//        assertTrue(authPage.iselementContainsTextDisplayed(message));
//    }

    */


    @Given("User is on Welcome Screen")
    public void userIsOnWelcomeScreen(String text) {
       // assertTrue(WelcomePage);
    }

    @When("User taps on {string} button")
    public void userTapsOnButton(String arg0) {
        welcomePage.selectLogin();
    }
    @And("User should be presented with the {string} as {string} by default")
    public void userShouldBePresentedWithMYAsByDefaultCountryCode(String fieldName, String value) {
        Boolean isTrue= loginpage.isDefaultCountryCodeMy(fieldName,value,20);
        assertTrue(isTrue);
    }
    @And("User taps on {string}")
    public void userTapsOnCountryCode(String arg0) {
            loginpage.selectCountryCodeOption(arg0);
    }


    @Given("User Should be presented with dropdown with different country code list")
    public void userShouldBePresentedWithDropdownWithDifferentCountryCodeList() {
        //to be added
    }

    @And("Then the country code dropdown should be scrollable")
    public void thenTheCountryCodeDropdownShouldBeScrollable() {

    }
}
