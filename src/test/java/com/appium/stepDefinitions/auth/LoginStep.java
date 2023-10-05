package com.appium.stepDefinitions.auth;

import com.appium.constants.TestContextConstants;
import com.appium.pages.AuthPage;
import io.cucumber.java.en.And;

import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;

import static com.appium.utils.FileUtils.readTXTFile;
import static org.testng.Assert.assertEquals;
import static org.testng.AssertJUnit.assertTrue;

public class LoginStep {
    AuthPage authPage = new AuthPage();

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
}
