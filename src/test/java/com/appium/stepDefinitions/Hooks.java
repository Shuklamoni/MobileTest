package com.appium.stepDefinitions;

import com.appium.manager.GlobalParams;
import com.appium.manager.ServerManager;
import io.cucumber.java.Scenario;
import org.apache.logging.log4j.ThreadContext;
import org.openqa.selenium.OutputType;

import com.appium.manager.DriverManager;

import io.cucumber.java.After;
import io.cucumber.java.Before;
public class Hooks {
    @Before
    public void setup(Scenario scenario) throws Exception {
        String platformName = "Android";
        String deviceName = "Pixel_3";
        String udid = "emulator-5554";
        /* This is for Log4J2 */
        ThreadContext.put("ROUTINGKEY", platformName + "_" + deviceName);

        GlobalParams params = new GlobalParams();
        params.setPlatformName(platformName);
        params.setUDID(udid);
        params.setDeviceName(deviceName);

        switch (platformName) {
            case "Android":
                params.setSystemPort("10000");
                params.setChromeDriverPort("11000");
                break;
            case "iOS":
                params.setWdaLocalPort("111000");
                params.setWebkitDebugProxyPort("111000");
                break;
        }

        new ServerManager().startServer();
        new DriverManager().initializeDriver();
//        new VideoManager().startRecording();
    }

    @After
    public void tearDown(Scenario scenario) {
        if (scenario.isFailed()) {
            byte[] screenshot = DriverManager.getDriver().getScreenshotAs(OutputType.BYTES);
            scenario.attach(screenshot, "image/png", scenario.getName());
        }
//        new VideoManager().stopRecording(scenario.getName());
        if (DriverManager.getDriver() != null) {
            DriverManager.getDriver().closeApp();
            DriverManager.getDriver().quit();
        }
        if (ServerManager.getServer() != null) {
            ServerManager.getServer().stop();
        }
    }
}
