package com.appium.utils;

import com.appium.constants.TestContextConstants;
import com.github.javafaker.Faker;

import java.util.Random;

public class RandomDataUtils {

    public static String generateEmail(int length) {
        StringBuilder emailAddress = new StringBuilder();
        String alphabet = "abcdefghijklmnopqrstuvwxyz0123456789";
        for(int i=0;i<length;i++) {
            int character = (int) (Math.random() * 26);
            emailAddress.append(alphabet.charAt(character));
        }
        emailAddress.append("@automationtest.com");
        return emailAddress.toString();
    }

    public static String generatePassword(int length) {
        String[] charCategories = new String[]{
                "abcdefghijklmnopqrstuvwxyz",
                "ABCDEFGHIJKLMNOPQRSTUVWXYZ",
                "0123456789",
//                "!@#$%^&*"
                "!@$%&*"
        };
        StringBuilder password = new StringBuilder(length);
        Random random = new Random();
        password.append(charCategories[0].charAt(random.nextInt(charCategories[0].length())));
        password.append(charCategories[1].charAt(random.nextInt(charCategories[1].length())));
        password.append(charCategories[2].charAt(random.nextInt(charCategories[2].length())));
        password.append(charCategories[3].charAt(random.nextInt(charCategories[3].length())));
        for (int i = 0; i < length - 4; i++) {
            String charCategory = charCategories[random.nextInt(charCategories.length)];
            int position = random.nextInt(charCategory.length());
            password.append(charCategory.charAt(position));
        }
        return new String(password);
    }

    public static String generateUsername(int length) {
        Faker faker = new Faker();
        return faker.regexify(String.format(TestContextConstants.USERNAME_GENERATOR_REGEX,length-1));
    }
}
