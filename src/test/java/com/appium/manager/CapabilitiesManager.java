package com.appium.manager;

import com.appium.utils.LogUtils;
import io.appium.java_client.remote.MobileCapabilityType;
import org.openqa.selenium.remote.DesiredCapabilities;

import java.io.File;
import java.io.IOException;
import java.util.Properties;

public class CapabilitiesManager {
	public DesiredCapabilities getCaps() throws IOException {
		GlobalParams params = new GlobalParams();
		Properties props = new PropertyManager().getProps();

		try {
			LogUtils.log().info("getting capabilities");
			DesiredCapabilities caps = new DesiredCapabilities();
			caps.setCapability(MobileCapabilityType.PLATFORM_NAME, params.getPlatformName());
			caps.setCapability(MobileCapabilityType.UDID, params.getUDID());
			caps.setCapability(MobileCapabilityType.DEVICE_NAME, params.getDeviceName());

			switch (params.getPlatformName()) {
			case "Android":
				caps.setCapability(MobileCapabilityType.AUTOMATION_NAME, props.getProperty("androidAutomationName"));
				caps.setCapability("appPackage", props.getProperty("androidAppPackage"));
				caps.setCapability("appActivity", props.getProperty("androidAppActivity"));
				caps.setCapability("systemPort", params.getSystemPort());
				caps.setCapability("chromeDriverPort", params.getChromeDriverPort());
				String androidAppUrl = System.getProperty("user.dir") + File.separator + "src" + File.separator + "test"
						+ File.separator + "resources" + File.separator + "app" + File.separator
						+ props.getProperty("androidAppLocation");
				LogUtils.log().info("appUrl is" + androidAppUrl);

				/* app -> This capability is needed to install the application in device */
				// caps.setCapability("app", androidAppUrl);
				break;
			case "iOS":
				caps.setCapability(MobileCapabilityType.AUTOMATION_NAME, props.getProperty("iOSAutomationName"));
				String iOSAppUrl = System.getProperty("user.dir") + File.separator + "src" + File.separator + "test"
						+ File.separator + "resources" + File.separator + "app" + File.separator
						+ props.getProperty("iOSAppLocation");
				LogUtils.log().info("appUrl is" + iOSAppUrl);
				caps.setCapability("bundleId", props.getProperty("iOSBundleId"));
				caps.setCapability("wdaLocalPort", params.getWdaLocalPort());
				caps.setCapability("webkitDebugProxyPort", params.getWebkitDebugProxyPort());

				/* app -> This capability is needed to install the application in device */
				caps.setCapability("app", iOSAppUrl);
				break;
			}
			return caps;
		} catch (Exception e) {
			e.printStackTrace();
			LogUtils.log().fatal("Failed to load capabilities. ABORT!!" + e.toString());
			throw e;
		}
	}
}
