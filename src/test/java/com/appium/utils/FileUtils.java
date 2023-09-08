package com.appium.utils;

import java.io.*;
import java.util.Scanner;

public class FileUtils {
    public static void createTXTFile(String path, String content) {
        Writer writer = null;

        try {
            writer = new BufferedWriter(new OutputStreamWriter(
                    new FileOutputStream(path), "utf-8"));
            writer.write(content);
        } catch (IOException ex) {
            System.out.print("something went wrong");
        } finally {
            try {
                writer.close();
            } catch (Exception ex) {/*ignore*/}
        }
    }

    public static String readTXTFile(String path) {
        StringBuilder builder = new StringBuilder();
        File file = new File(path);
        Scanner sc = null;
        try {
            sc = new Scanner(file);
        } catch (FileNotFoundException e) {
            throw new RuntimeException(e);
        }

        while (sc.hasNextLine()) {
            builder.append(sc.nextLine());
        }

        return builder.toString();
    }
}