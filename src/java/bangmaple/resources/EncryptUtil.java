/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bangmaple.resources;

import java.io.Serializable;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 *
 * @author bangmaple
 */
public class EncryptUtil implements Serializable {

    public static String encryptPassword(final String password) throws NoSuchAlgorithmException {
        byte[] getPasswordByteField = password.getBytes();
        MessageDigest md = MessageDigest.getInstance("MD5");
        byte[] getEncryptedPasswordByteField = md.digest(getPasswordByteField);
        BigInteger encryptedPassword = new BigInteger(1, getEncryptedPasswordByteField);
        return encryptedPassword.toString(16);
    }
    
}
