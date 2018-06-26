package com.cwb.platform.biz.baidu;

import java.util.HashMap;
import java.util.Map;

import org.apache.http.client.HttpClient;
import org.joda.time.DateTime;
import org.json.JSONObject;

import com.baidu.aip.ocr.AipOcr;
import com.cwb.platform.util.commonUtil.HttpUtil;
import com.google.common.collect.Maps;


public class AiApis {

	// 初始化一个AipOcr
	final static AipOcr client = new AipOcr("10334600", "sE9HAgpK2XKsrKiuorzCoory", "HNyUWG5Od5docsq83l5l6hVgdKv6Etng");
	
	static{
		// 设置网络连接参数
        client.setConnectionTimeoutInMillis(2000);
        client.setSocketTimeoutInMillis(60000);
	}
	
	/**
	 * 根据行驶证图片字节，分析出行驶证文本内容。返回文本JSON对象数组
	 * 
	 * @param images
	 * @return
	 */
	public static JSONObject vehicleLicenseFromImageBytes(byte[] images){
		JSONObject result = null;
		// 传入可选参数调用接口
	    HashMap<String, String> options = new HashMap<String, String>();
	    options.put("accuracy", "normal");
	    try{
	    	JSONObject tmp = client.vehicleLicense(images, options);
	    	result = tmp.getJSONObject("words_result");
	    }catch (Exception e) {
			
		}
	    
	    return result;
	}
	
	/**
	 * 根据驾驶证图片字节，分析出行驶证文本内容。返回文本JSON对象数组
	 * 
	 * @param images
	 * @return
	 */
	public static JSONObject drivingLicense(byte[] images){
		JSONObject result = null;
		// 传入可选参数调用接口
	    HashMap<String, String> options = new HashMap<String, String>();
	    options.put("accuracy", "normal");
	    try{
	    	JSONObject tmp = client.drivingLicense(images, options);
	    	result = tmp.getJSONObject("words_result");
	    }catch (Exception e) {
			
		}
	    
	    return result;
	}
	
	/**
	 * 根据行驶证图片字节，分析出行驶证文本内容。返回文本JSON对象数组
	 * 
	 * @param images
	 * @param cardside front：身份证含照片的一面；back：身份证带国徽的一面
	 * @return
	 */
	public static JSONObject idcardFromImageBytes(byte[] images, String cardside){
		JSONObject result = null;
		// 传入可选参数调用接口
	    HashMap<String, String> options = new HashMap<String, String>();
	    options.put("accuracy", "normal");
	    try{
	    	JSONObject tmp = client.idcard(images, cardside, options);
	    	result = tmp.getJSONObject("words_result");
	    }catch (Exception e) {
			
		}
	    
	    return result;
	}
	
	public static void main(String[] args) {
		String info = null;
		try{
			
			System.out.println(DateTime.now().parse("2018-09-04"));
		}catch (Exception e) {
			e.printStackTrace();
		}

	}
}
