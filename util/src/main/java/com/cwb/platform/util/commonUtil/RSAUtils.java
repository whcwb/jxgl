package com.cwb.platform.util.commonUtil;

import java.io.ByteArrayOutputStream;
import java.security.Key;
import java.security.KeyFactory;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.interfaces.RSAPublicKey;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;

import javax.crypto.Cipher;

import org.apache.commons.codec.binary.Base64;

/**
 * 生成RSA密钥文件，用于设备商数据交换加密用
 * @author Lee
 *
 */
public class RSAUtils {
	
	public static final String PRIVATEMAPKEY = "MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAJM5GRGMR10iDk2z0oNqPJh/JsBqzwMz/c3NdG+PNF7cw1+l1dxo1PE2J4RPFU/pdVVjfKWKacae0adDNe0Viy2hQplI8Md1GiBzDQcqjO59uqiX2tbdoQvt/1Zi/SApODZaM5qgTLOEyaMkZAaDNkud3I/sA6WN860QGUIOoDN7AgMBAAECgYAtxUek6/7X1pmp0Kk3EBVMt+M9WTeI4GYc0K5NbLE0eOAI4Y7ummzxnQuGF+whTwyagnajJLgj9wZpQP0H+3WsO1BCIYw2SSaME9NT4C5o/6RA6eIfvUlJGolQwYvOlPUlipUagQW78z6tYCdULLPHtDCqbiX2NwDgpdmtL+wFIQJBAPJSAoonATSIIGo96U/AtKATYE8Y5HrwfZlUi7OOvZz822dRLDW528REAVGuSnzXm5sRusxYAzmn2LYmpRK3ejECQQCbiMA8Q8OydM9kkw/9XxbZIIjZ3RQAsxBf62tfk8ZpqHIiLnHoWl220Hut/OH02wuHzqG5mtF/HVU9lfM+aPFrAkEAgMo1r1ervE/dapodNtYlKi8iMOf6B51qI+Rbm8Nx485AjlkGNkfiFh5O1SrdTB0MBw8VSSY+EJa1B5rigWAjAQJAfbNJ2erScJnjO193nsiJCLY4pAr+rYoKg9saDka6Jo5Sn7l1qdnOv39DVdx5KZEWgo3HOuAazGcCiyFzU08xPQJAcG3dOn+VALA8Njw95z0vHGGsocNjt+1LRrxkAu1RBDk3FZ7owA7Huc02WOzd35Zy84GSwGe5PoFa+Vr7n4Xztg==";
	public static final String PUBLICMAPKEY = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCTORkRjEddIg5Ns9KDajyYfybAas8DM/3NzXRvjzRe3MNfpdXcaNTxNieETxVP6XVVY3ylimnGntGnQzXtFYstoUKZSPDHdRogcw0HKozufbqol9rW3aEL7f9WYv0gKTg2WjOaoEyzhMmjJGQGgzZLndyP7AOljfOtEBlCDqAzewIDAQAB";
	
	/** *//** 
     * RSA最大加密明文大小 
     */  
    private static final int MAX_ENCRYPT_BLOCK = 117;  
      
    /** *//** 
     * RSA最大解密密文大小 
     */  
    private static final int MAX_DECRYPT_BLOCK = 128;  
    
	/**
	 * RSA加密并转换base64字符串
	 * @param str				待加密字符串
	 * @param privateKeyPath	私钥文件路径。接收数据方使用公钥解密
	 * @return
	 * @throws Exception
	 */
	public static String encryptWithRSA(String str, String publicKey) throws Exception {
		KeyFactory keyFactory = KeyFactory.getInstance("RSA");
        X509EncodedKeySpec x509KeySpec = new X509EncodedKeySpec(Base64.decodeBase64(publicKey));
        RSAPublicKey key = (RSAPublicKey) keyFactory.generatePublic(x509KeySpec);

		//获取一个加密算法为RSA的加解密器对象cipher。
		Cipher cipher = Cipher.getInstance("RSA");
		//设置为加密模式,并将公钥给cipher。
		cipher.init(Cipher.ENCRYPT_MODE, key);
		// 加密时超过117字节就报错。为此采用分段加密的办法来加密  
		ByteArrayOutputStream out = new ByteArrayOutputStream();  
		byte[] data = str.getBytes();
		int inputLen = data.length;  
		int offSet = 0;  
        byte[] cache;  
        int i = 0;  
        // 对数据分段加密  
        while (inputLen - offSet > 0) {  
            if (inputLen - offSet > MAX_ENCRYPT_BLOCK) {  
                cache = cipher.doFinal(data, offSet, MAX_ENCRYPT_BLOCK);  
            } else {  
                cache = cipher.doFinal(data, offSet, inputLen - offSet);  
            }  
            out.write(cache, 0, cache.length);  
            i++;  
            offSet = i * MAX_ENCRYPT_BLOCK;  
        }  
        byte[] encryptedData = out.toByteArray();  
        out.close(); 
		//进行Base64编码
		return Base64.encodeBase64String(encryptedData);
	}
	
	public static String encryptWithRSAByPublicKey(String str) throws Exception {
		String publicKey = PUBLICMAPKEY;
		KeyFactory keyFactory = KeyFactory.getInstance("RSA");
        X509EncodedKeySpec x509KeySpec = new X509EncodedKeySpec(Base64.decodeBase64(publicKey));
        RSAPublicKey key = (RSAPublicKey) keyFactory.generatePublic(x509KeySpec);

		//获取一个加密算法为RSA的加解密器对象cipher。
		Cipher cipher = Cipher.getInstance("RSA");
		//设置为加密模式,并将公钥给cipher。
		cipher.init(Cipher.ENCRYPT_MODE, key);
		// 加密时超过117字节就报错。为此采用分段加密的办法来加密  
		ByteArrayOutputStream out = new ByteArrayOutputStream();  
		byte[] data = str.getBytes();
		int inputLen = data.length;  
		int offSet = 0;  
        byte[] cache;  
        int i = 0;  
        // 对数据分段加密  
        while (inputLen - offSet > 0) {  
            if (inputLen - offSet > MAX_ENCRYPT_BLOCK) {  
                cache = cipher.doFinal(data, offSet, MAX_ENCRYPT_BLOCK);  
            } else {  
                cache = cipher.doFinal(data, offSet, inputLen - offSet);  
            }  
            out.write(cache, 0, cache.length);  
            i++;  
            offSet = i * MAX_ENCRYPT_BLOCK;  
        }  
        byte[] encryptedData = out.toByteArray();  
        out.close(); 
		//进行Base64编码
		return Base64.encodeBase64String(encryptedData);
	}

	//
	/**
	 * RSA解密，解密数据是base64字符串
	 * @param secret			base64编码字符串
	 * @param privateKeyPath	私钥文件路径。数据发送方使用公钥加密数据
	 * @return
	 * @throws Exception
	 */
	public static String decryptWithRSA(String secret, String privateKeyBase64) throws Exception {
		PKCS8EncodedKeySpec keySpec= new PKCS8EncodedKeySpec(Base64.decodeBase64(privateKeyBase64));  
        KeyFactory keyFactory= KeyFactory.getInstance("RSA");  
        Key privateKey = keyFactory.generatePrivate(keySpec);
		
		Cipher cipher = Cipher.getInstance("RSA");
		//传递私钥，设置为解密模式。
		cipher.init(Cipher.DECRYPT_MODE, privateKey);
		// 解密时超过128字节就报错。为此采用分段加密的办法来解密
		byte[] encryptedData = Base64.decodeBase64(secret.replaceAll("\r\n", ""));
		int inputLen = encryptedData.length;  
        ByteArrayOutputStream out = new ByteArrayOutputStream();  
        int offSet = 0;  
        byte[] cache;  
        int i = 0;  
        // 对数据分段解密  
        while (inputLen - offSet > 0) {  
            if (inputLen - offSet > MAX_DECRYPT_BLOCK) {  
                cache = cipher.doFinal(encryptedData, offSet, MAX_DECRYPT_BLOCK);  
            } else {  
                cache = cipher.doFinal(encryptedData, offSet, inputLen - offSet);  
            }  
            out.write(cache, 0, cache.length);  
            i++;  
            offSet = i * MAX_DECRYPT_BLOCK;  
        }  
        byte[] decryptedData = out.toByteArray();  
        out.close();  
		//解密器解密由Base64解码后的密文,获得明文字节数组
		return new String(decryptedData);
	}
	
	public static String decryptWithRSA(String secret) throws Exception {
		String privateKeyBase64 = PRIVATEMAPKEY;
		PKCS8EncodedKeySpec keySpec= new PKCS8EncodedKeySpec(Base64.decodeBase64(privateKeyBase64));  
        KeyFactory keyFactory= KeyFactory.getInstance("RSA");  
        Key privateKey = keyFactory.generatePrivate(keySpec);
		
		Cipher cipher = Cipher.getInstance("RSA");
		//传递私钥，设置为解密模式。
		cipher.init(Cipher.DECRYPT_MODE, privateKey);
		// 解密时超过128字节就报错。为此采用分段加密的办法来解密
		byte[] encryptedData = Base64.decodeBase64(secret.replaceAll("\r\n", ""));
		int inputLen = encryptedData.length;  
        ByteArrayOutputStream out = new ByteArrayOutputStream();  
        int offSet = 0;  
        byte[] cache;  
        int i = 0;  
        // 对数据分段解密  
        while (inputLen - offSet > 0) {  
            if (inputLen - offSet > MAX_DECRYPT_BLOCK) {  
                cache = cipher.doFinal(encryptedData, offSet, MAX_DECRYPT_BLOCK);  
            } else {  
                cache = cipher.doFinal(encryptedData, offSet, inputLen - offSet);  
            }  
            out.write(cache, 0, cache.length);  
            i++;  
            offSet = i * MAX_DECRYPT_BLOCK;  
        }  
        byte[] decryptedData = out.toByteArray();  
        out.close();  
		//解密器解密由Base64解码后的密文,获得明文字节数组
		return new String(decryptedData);
	}
	
	/** 
	 * 使用私钥对数据进行加密签名 
	 * @param data 数据 
	 * @param privateKeyString 私钥 
	 * @return 加密后的签名 
	 */  
	public static String sign(String data, String privateKeyBase64) throws Exception {  
	    KeyFactory keyf = KeyFactory.getInstance("RSA");  
	    PrivateKey privateKey = keyf.generatePrivate(new PKCS8EncodedKeySpec(Base64.decodeBase64(privateKeyBase64)));  
	    java.security.Signature signet = java.security.Signature.getInstance("MD5withRSA");  
	    signet.initSign(privateKey);  
	    signet.update(data.getBytes("utf-8"));  
	    byte[] signed = signet.sign();  
	    return Base64.encodeBase64String(signed);  
	}  
	
	/** 
	 * 使用公钥判断签名是否与数据匹配 
	 * @param data 数据 
	 * @param sign 签名 
	 * @param publicKeyString 公钥 
	 * @return 是否篡改了数据 
	 */  
	public static boolean verify(String data, String sign, String publicKeyBase64) throws Exception {  
	    KeyFactory keyf = KeyFactory.getInstance("RSA");  
	    PublicKey publicKey = keyf.generatePublic(new X509EncodedKeySpec(Base64.decodeBase64(publicKeyBase64)));  
	    java.security.Signature signet = java.security.Signature.getInstance("MD5withRSA");  
	    signet.initVerify(publicKey);  
	    signet.update(data.getBytes("utf-8"));  
	    return signet.verify(Base64.decodeBase64(sign));  
	} 
}