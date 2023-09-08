package com.appium.manager;

import com.appium.utils.LogUtils;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class PropertyManager {

    public Properties getProps() throws IOException {
        Properties props = new Properties();
        InputStream is = null;
        String propsFileName = "config.properties";
        try{
            LogUtils.log().info("loading config properties");
            is = getClass().getClassLoader().getResourceAsStream(propsFileName);
            props.load(is);
        } catch (IOException e) {
            e.printStackTrace();
            LogUtils.log().fatal("Failed to load config properties. ABORT!!" + e.toString());
            throw e;
        } finally {
            if(is != null){
                is.close();
            }
        }
        return props;
    }
}
