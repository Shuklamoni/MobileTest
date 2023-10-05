package com.appium.pages;
import com.appium.manager.DriverManager;
import io.appium.java_client.AppiumDriver;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import io.appium.java_client.android.AndroidDriver;
import io.appium.java_client.ios.IOSDriver;
import org.openqa.selenium.remote.DesiredCapabilities;
import java.net.URL;
import javax.swing.*;

public class WelcomePage extends BasePage {

    AppiumDriver driver = DriverManager.getDriver();
    // Locate and interact with elements
    //WebElement element  = driver.findElement(By.xpath(""));



    public void selectSignUpWithAccount() {
        this.clickOnButtonInText("");
        }

    public void selectContinueWithWallet() {
        this.clickOnButtonInText("");
    }

    public void selectContinueWithApple() {
        this.clickOnButtonInText("");
    }
    public void selectContinueWithGoogle() {
        this.clickOnButtonInText("");
    }

    public void selectLogin() {
        this.clickOnButtonInText("");

    }

    public boolean isWelcomeScreen(){
        String buttonName = null;
        return  this.iselementContainsTextDisplayed(buttonName);

    }

}
