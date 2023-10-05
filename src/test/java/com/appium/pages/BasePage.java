package com.appium.pages;

import com.appium.constants.TestContextConstants;
import com.appium.manager.DriverManager;
import com.appium.manager.GlobalParams;
import com.appium.utils.LogUtils;
import com.google.common.collect.ImmutableMap;
import io.appium.java_client.*;
import io.appium.java_client.pagefactory.AppiumFieldDecorator;
import org.openqa.selenium.*;
import org.openqa.selenium.remote.RemoteWebElement;
import org.openqa.selenium.support.PageFactory;
import org.openqa.selenium.support.ui.*;
import java.time.Duration;
import java.util.HashMap;

import static io.appium.java_client.touch.WaitOptions.waitOptions;
import static io.appium.java_client.touch.offset.PointOption.point;
import static java.time.Duration.ofMillis;

public class BasePage {
    private AppiumDriver driver;
    public WebDriverWait wait;

    public BasePage() {
        this.driver = DriverManager.getDriver();
        PageFactory.initElements(new AppiumFieldDecorator(this.driver), this);
        wait = new WebDriverWait(driver,Duration.ofSeconds(TestContextConstants.WAIT));
    }

    String elementContainsText = "//*[contains(@text,'%s')]";
    String buttonContainText = "//*[contains(@text,'%s')]/..";

    public boolean isButtonEnabled(String buttonName) {
        By by = By.xpath(String.format(buttonContainText, buttonName));
        return waitForVisibility(by).isEnabled();
    }

    public void enter(String fieldName, String value) {
        By by = By.xpath(String.format(elementContainsText, fieldName));
        waitForVisibility(by).sendKeys(value);
    }

    public void clickOnButtonInText(String text) {
        By by = By.xpath(String.format(buttonContainText, text));
        waitForClickable(by).click();
    }

    public void performKeys(String text, Keys keys) {
        By by = By.xpath(String.format(elementContainsText, text));
        waitForVisibility(by).sendKeys(keys);
    }

    public boolean iselementContainsTextDisplayed(String value) {
        if (this.isDisplayed(elementContainsText, value, 5)) {
            return true;
        } else {
            return false;
        }
    }

    public WebElement waitForClickable(WebElement e) {
        return wait.until(ExpectedConditions.elementToBeClickable(e));
    }

    public WebElement waitForClickable(By by) {
        return wait.until(ExpectedConditions.elementToBeClickable(by));
    }

    public void waitForVisibility(WebElement e) {
        wait.until(ExpectedConditions.visibilityOf(e));
    }

    public WebElement waitForVisibility(By e) {
        return wait.until(ExpectedConditions.visibilityOfElementLocated(e));
    }

    public WebElement waitForVisibility(String text) {
        By by = By.xpath(String.format(elementContainsText, text));
        return wait.until(ExpectedConditions.visibilityOfElementLocated(by));
    }

    public void waitUntilelementContainsTextInvisible(String text, int timeoutInSeconds, int pollingTimeInMillis) {
        By by = By.xpath(String.format(elementContainsText, text));
        fluentWait(timeoutInSeconds, pollingTimeInMillis)
                .until(webDriver -> ExpectedConditions.invisibilityOfElementLocated(by));
    }

    public boolean isDisplayed(WebElement e, int timeoutInSeconds) {
        try {
            wait.withTimeout(Duration.ofSeconds(timeoutInSeconds)).until(ExpectedConditions.visibilityOf(e));
            return true;
        } catch (TimeoutException exp) {
            return false;
        }
    }

    public boolean isDisplayed(String locator, String value, int timeoutInSeconds) {
        try {
            By by = By.xpath(String.format(locator, value));
            wait.withTimeout(Duration.ofSeconds(timeoutInSeconds)).until(ExpectedConditions.visibilityOfElementLocated(by));
            return true;
        } catch (TimeoutException exp) {
            return false;
        }
    }

    public FluentWait fluentWait(int timeoutInSeconds, int pollingTimeInMillis) {
        return new FluentWait<>(driver)
                .withTimeout(Duration.ofSeconds(timeoutInSeconds))
                .pollingEvery(Duration.ofMillis(pollingTimeInMillis));
    }

    public void clear(WebElement e) {
        waitForVisibility(e);
        e.clear();
    }

    public void click(WebElement e) {
        waitForVisibility(e);
        e.click();
    }

    public void click(WebElement e, String msg) {
        waitForVisibility(e);
        LogUtils.log().info(msg);
        e.click();
    }

    public void click(By e, String msg) {
        waitForVisibility(e);
        LogUtils.log().info(msg);
        driver.findElement(e).click();
    }

    public void sendKeys(WebElement e, String txt) {
        waitForVisibility(e);
        e.sendKeys(txt);
    }

    public void sendKeys(WebElement e, String txt, String msg) {
        waitForVisibility(e);
        LogUtils.log().info(msg);
        e.sendKeys(txt);
    }

    public String getAttribute(WebElement element, String attribute) {
        waitForVisibility(element);
        return element.getAttribute(attribute);
    }

    public String getAttribute(By element, String attribute) {
        waitForVisibility(element);
        return driver.findElement(element).getAttribute(attribute);
    }

    public String getText(WebElement element, String msg) {
        String txt;
        switch (new GlobalParams().getPlatformName()) {
            case "Android":
                txt = getAttribute(element, "text");
                break;
            case "iOS":
                txt = getAttribute(element, "label");
                break;
            default:
                throw new IllegalStateException("Unexpected value: " + new GlobalParams().getPlatformName());
        }
        LogUtils.log().info(msg + txt);
        return txt;
    }

    public String getText(By by, String msg) {
        String txt;
        switch (new GlobalParams().getPlatformName()) {
            case "Android":
                txt = getAttribute(by, "text");
                break;
            case "iOS":
                txt = getAttribute(by, "label");
                break;
            default:
                throw new IllegalStateException("Unexpected value: " + new GlobalParams().getPlatformName());
        }
        LogUtils.log().info(msg + txt);
        return txt;
    }

    public void clearApp(String appPackage) {
        driver.executeScript("mobile: clearApp", ImmutableMap.of("appId",appPackage));
    }

    public void startActivity(String appPackage,String appActivity) {
        driver.executeScript("mobile: startActivity", ImmutableMap.of("intent",appPackage+"/"+appActivity));

    }

    public WebElement andScrollToElementUsingUiScrollable(String childLocAttr, String childLocValue) {
        return (WebElement) ((FindsByAndroidUIAutomator) driver).findElementByAndroidUIAutomator(
                "new UiScrollable(new UiSelector()" + ".scrollable(true)).scrollIntoView("
                        + "new UiSelector()." + childLocAttr + "(\"" + childLocValue + "\"));");
    }

    public WebElement iOSScrollToElementUsingMobileScroll(WebElement e) {
        RemoteWebElement element = ((RemoteWebElement) e);
        String elementID = element.getId();
        HashMap<String, String> scrollObject = new HashMap<String, String>();
        scrollObject.put("element", elementID);
//	  scrollObject.put("direction", "down");
//	  scrollObject.put("predicateString", "label == 'ADD TO CART'");
//	  scrollObject.put("name", "test-ADD TO CART");
        scrollObject.put("toVisible", "sdfnjksdnfkld");
        driver.executeScript("mobile:scroll", scrollObject);
        return e;
    }

    public By iOSScrollToElementUsingMobileScrollParent(WebElement parentE, String predicateString) {
        RemoteWebElement parent = (RemoteWebElement) parentE;
        String parentID = parent.getId();
        HashMap<String, String> scrollObject = new HashMap<String, String>();
        scrollObject.put("element", parentID);
//	  scrollObject.put("direction", "down");
        scrollObject.put("predicateString", predicateString);
//	  scrollObject.put("name", "test-ADD TO CART");
//        scrollObject.put("toVisible", "sdfnjksdnfkld");
        driver.executeScript("mobile:scroll", scrollObject);
        By m = MobileBy.iOSNsPredicateString(predicateString);
        System.out.println("Mobilelement is " + m);
        return m;
    }

    public WebElement scrollToElement(WebElement element, String direction) throws Exception {
        Dimension size = driver.manage().window().getSize();
        int startX = (int) (size.width * 0.5);
        int endX = (int) (size.width * 0.5);
        int startY = 0;
        int endY = 0;
        boolean isFound = false;

        switch (direction) {
            case "up":
                endY = (int) (size.height * 0.4);
                startY = (int) (size.height * 0.6);
                break;

            case "down":
                endY = (int) (size.height * 0.6);
                startY = (int) (size.height * 0.4);
                break;
        }

        for (int index = 0; index < 3; index++) {
            if (find(element, 1)) {
                isFound = true;
                break;
            } else {
                swipe(startX, startY, endX, endY, 1000);
            }
        }
        if (!isFound) {
            throw new Exception("Element not found");
        }
        return element;
    }

    public By scrollToElement(By element, String direction) throws Exception {
        Dimension size = driver.manage().window().getSize();
        int startX = (int) (size.width * 0.5);
        int endX = (int) (size.width * 0.5);
        int startY = 0;
        int endY = 0;
        boolean isFound = false;

        switch (direction) {
            case "up":
                endY = (int) (size.height * 0.4);
                startY = (int) (size.height * 0.6);
                break;

            case "down":
                endY = (int) (size.height * 0.6);
                startY = (int) (size.height * 0.4);
                break;
        }

        for (int i = 0; i < 3; i++) {
            if (find(element, 1)) {
                isFound = true;
                break;
            } else {
                swipe(startX, startY, endX, endY, 1000);
            }
        }
        if (!isFound) {
            throw new Exception("Element not found");
        }
        return element;
    }

    public boolean find(final WebElement element, int timeout) {
        try {
            WebDriverWait wait = new WebDriverWait(driver, timeout);
            return wait.until(new ExpectedCondition<Boolean>() {
                @Override
                public Boolean apply(WebDriver driver) {
                    if (element.isDisplayed()) {
                        return true;
                    }
                    return false;
                }
            });
        } catch (Exception e) {
            return false;
        }
    }

    public boolean find(final By element, int timeout) {
        try {
            WebDriverWait wait = new WebDriverWait(driver, timeout);
            return wait.until(new ExpectedCondition<Boolean>() {
                @Override
                public Boolean apply(WebDriver driver) {
                    if (driver.findElement(element).isDisplayed()) {
                        return true;
                    }
                    return false;
                }
            });
        } catch (Exception e) {
            return false;
        }
    }

    public void swipe(int startX, int startY, int endX, int endY, int millis)
            throws InterruptedException {
        TouchAction t = new TouchAction(driver);
        t.press(point(startX, startY)).waitAction(waitOptions(ofMillis(millis))).moveTo(point(endX, endY)).release()
                .perform();

    }
}
