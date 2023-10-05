package com.appium.stepDefinitions.auth;

import com.appium.pages.*;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;

import static org.testng.AssertJUnit.assertEquals;
import static org.testng.AssertJUnit.assertTrue;

public class SignupStep {
    AuthPage authPage = new AuthPage();
    WelcomePage welcomePage = new WelcomePage();
    SignUpWithPhonePage signUpWithPhone = new SignUpWithPhonePage();
    OtpVerificationPage otpVerPage = new OtpVerificationPage();

    AliasPage aliasPage = new AliasPage();



    String password;

    /*
    @And("User enter {string} with {int} characters")
    public void userEnterWithCharacters(String field, int length) {
        if (field.equals("Username")) {
            authPage.enter(field, generateUsername(length));
        } else if (field.equals("Password")) {
            password = generatePassword(length);
            authPage.enter(field, password);
        }
    }

    @And("User enter valid {string}")
    public void userEnterValid(String field) throws InterruptedException {
        if (field.equals("Email")) {
            authPage.enter(field, generateEmail(12));
        } else if (field.equals("Phone")) {
            // temporary hard code the country code to India
            String phone = "97" + RandomStringUtils.randomNumeric(8);
            authPage.enter(field, phone);
            // waiting for phone number validation
            Thread.sleep(1000);
        }
    }

    @And("User enter invalid {string} with value {string}")
    public void userEnterInvalid(String field, String value) {
        authPage.enter(field, value);
    }

    @And("User enter {string} same as password")
    public void userenterConfirmPasswordSameAsPassword(String filedName) {
        authPage.enter(filedName, password);
    }

    @And("User select phone number country {string} with country code {string}")
    public void userSelectPhoneNumberCountry(String country, String countryCode) {
        authPage.selectCountryCode(country, countryCode);
    }

    @Then("User is presented with field error {string}")
    public void userIsPresentedWithFieldError(String text) {
        assertTrue(authPage.iselementContainsTextDisplayed(text));
    }

    @And("User enter empty {string}")
    public void userEnterEmpty(String filedName) {
        String value = "123";
        authPage.enter(filedName, value);
        if (filedName.equals("Password")){
            value="•••";
        }
        authPage.enter(value, "");
    }

    @And("User enter {string} different from password")
    public void userEnterConfirmPasswordDifferentFromPassword(String fieldName) {
        authPage.enter(fieldName, "12wIwe@!");
    }

//    @Then("User actually only entered {int} characters in {string}")
//    public void userActuallyOnlyEnteredCharacters(int characterLength, String fieldName) {
//       assertEquals( characterLength, authPage.getEnteredText().size());
//    }
}


*/
    @When("user taps on {string}")
    public void userTapsOnSignUpWithAccount(String option){
        welcomePage.selectSignUpWithAccount(option);

    }

    @And("User should be presented with the default {string}")
    public void userShouldBePresentedWithTheDefault(String fieldName, String value) {
        Boolean isTrue= signUpWithPhone.isDefaultCountryCodeMy(fieldName,value,20);
        assertTrue(isTrue);
    }
    @And("User taps on {string}")
    public void userTapsOnCountryCode(String option) {
        signUpWithPhone.selectCountryCodeOption(option);
    }

    @And("User selects the country code {string}.{string}")
    public void userSelectsTheCountryCode(String countryName,String countryCode) {
        signUpWithPhone.selectCountryCode(countryName,countryCode);
    }
    @And("User enters a valid {string}")
    public void userEntersAValidPhoneNumber(String fieldName, String phoneNumber) {
        signUpWithPhone.enterMobileNumber("Phone Number",phoneNumber);
    }
    @And("Tickmark icon should be displayed")
    public void tickmarkIconShouldBeDisplayedForValidPhoneNumber() {
        assertTrue(signUpWithPhone.isTicMarkPresent());
    }

    @Then("{string} Button Should get enabled  is {string}")
    public void buttonShouldGetEnabled(String buttonName) {
        assertTrue(signUpWithPhone.isSetCourseEnabled(buttonName));
    }

    @Then("User is presented with inline error {string}")
    public void userIsPresentedWithInlineError(String text) {
        assertEquals(text,signUpWithPhone.inlineErrorMessage());
    }


    @And("User enters valid {string}")
    public void userEntersValidOTP(String otp) {
        Response userData = otpVerPage.fetchOtp();
        otpVerPage.enterOtp(otp);
    }

    @And("User enters a valid {String}")
    public  void enterValidAliasName(String aliasName){
        aliasPage.enterAlias(aliasName);
    }


    @And("{string} button should get isEnabled is {string}")
    public void setUsernamebuttonShouldGetIsEnabledIs(String buttonName, String isEnabled) {
        assertTrue(aliasPage.isSetUsernameEnabled(buttonName));
    }

    @And("User taps on {string}")
    public void tapsSetUsernamebutton(String buttonName){
        aliasPage.tapOnSetUsername(buttonName);
    }
    @Then("User should get signedUp and {String} screen should be visible")
    public void isHomeScreenVisible(){
        assertTrue(welcomePage.isWelcomeScreen());
    }

    @And("User enters a valid {string}")
    public void userEntersAValidEmailAddress(String fieldName, String emailAddress) {
        signUpWithPhone.enterMobileNumber("Email Address",emailAddress);
    }
    @And("User taps on {String}")
    public void userTapsOnEmail(String buttonName){
        signUpWithPhone.selectEmail(buttonName);
    }



}