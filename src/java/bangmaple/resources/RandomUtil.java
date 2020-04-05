/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bangmaple.resources;

import java.io.Serializable;

/**
 *
 * @author bangmaple
 */
public class RandomUtil implements Serializable {

    private static final String CHAR_LOWER = "abcdefghijklmnopqertuvwyz";
    private static final String CHAR_UPPER = CHAR_LOWER.toUpperCase();
    private static final String NUMBER = "0123456789";
    private static final String DATA_FOR_RANDOM_STRING = CHAR_LOWER
            + CHAR_UPPER + NUMBER;
    private static final int DEFUALT_PASSWORD_LENGTH = 8;
    private static final int SIX_NUMBER_TOKEN_LENGTH = 6;
    private static final java.security.SecureRandom RANDOM
            = new java.security.SecureRandom();

    public static String getRandomizedString() {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < DEFUALT_PASSWORD_LENGTH; i++) {
            int randomCharAt = RANDOM.nextInt(DATA_FOR_RANDOM_STRING
                    .length());
            char randomChar = DATA_FOR_RANDOM_STRING
                    .charAt(randomCharAt);
            sb.append(randomChar);
        }
        return sb.toString();
    }

    public static String getRandomizedSixNumbers() {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < SIX_NUMBER_TOKEN_LENGTH; i++) {
            int randomCharAt = RANDOM.nextInt(NUMBER.length());
            char randomChar = NUMBER.charAt(randomCharAt);
            sb.append(randomChar);
        }
        return sb.toString();
    }

    public static String getRandomizedEightNumbers() {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < DEFUALT_PASSWORD_LENGTH; i++) {
            int randomCharAt = RANDOM.nextInt(NUMBER.length());
            char randomChar = NUMBER.charAt(randomCharAt);
            sb.append(randomChar);
        }
        return sb.toString();
    }
}
