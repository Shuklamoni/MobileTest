package com.appium.manager;

import com.appium.utils.LogUtils;
import io.appium.java_client.AppiumDriver;
import io.appium.java_client.android.AndroidDriver;
import io.appium.java_client.ios.IOSDriver;

import java.io.IOException;
public class DriverManager {
    private static ThreadLocal<AppiumDriver> driver = new ThreadLocal<>();

    public static AppiumDriver getDriver(){
        return driver.get();
    }

    public static void setDriver(AppiumDriver driver2){
        driver.set(driver2);
    }

    public void initializeDriver() throws Exception {
        AppiumDriver driver = null;
        GlobalParams params = new GlobalParams();
        PropertyManager props = new PropertyManager();

        try{
            LogUtils.log().info("initializing Appium driver");
            switch(params.getPlatformName()){
                case "Android":
                    driver = new AndroidDriver(ServerManager.getServer().getUrl(), new CapabilitiesManager().getCaps());
                    break;
                case "iOS":
                    driver = new IOSDriver(ServerManager.getServer().getUrl(), new CapabilitiesManager().getCaps());
                    break;
            }
            if(driver == null){
                throw new Exception("driver is null. ABORT!!!");
            }
            LogUtils.log().info("Driver is initialized");
            DriverManager.driver.set(driver);
        } catch (IOException exception) {
            exception.printStackTrace();
            LogUtils.log().fatal("Driver initialization failure. ABORT !!!!" + exception.toString());
            throw exception;
        }

    }

}
