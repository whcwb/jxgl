package com.cwb.platform.biz.api;

import com.cwb.platform.util.commonUtil.HttpUtil;
import com.cwb.platform.util.commonUtil.RSAUtils;
import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.common.collect.Maps;

import java.util.HashMap;
import java.util.Map;

public class TestMain {

	static ObjectMapper mapper = new ObjectMapper()
			.setSerializationInclusion(Include.NON_NULL).configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);

//	static String baseUrl = "http://119.97.172.181:8180/pub/";
	static String baseUrl = "http://127.0.0.1:8088/pub/";

	public static void main(String[] args) throws Exception{
		//vehInfo();
		//RSAUtils.decryptWithRSA("M6NJJgZq/PZ5a3AGHRheR4zWZbDTrOhZZVwiyjFRQUgPQxB3aHkxXEdSxWyobl5agSH3JEKESESJK7oy7sIvGJWscNFXjcpZx8pF9VW1+qShRxs3UDE3GudL8J+hJARs8o0cihxnt7Rl+AY82vlKl5ly4/fefoTlxcprpLwddKk=");
		vehInfo();
	}

	/**
	 * 推送车辆信息
	 * @throws Exception
	 */
	public static void vehInfo() throws Exception{
		Map<String, String> info = new HashMap<String, String>();
		info.put("hphm", "鄂AQ953");
		info.put("hpzl", "16");
		info.put("zt", "AG");

		String json = mapper.writeValueAsString(info);
		System.out.println(json);
		Map<String, String> params = Maps.newConcurrentMap();
		params.put("data", RSAUtils.encryptWithRSAByPublicKey(json));

		System.out.println(HttpUtil.post(baseUrl + "/api/vehInfo", params, "UTF-8"));
	}

	/**
	 * 推送违法信息
	 * @throws Exception
	 */
	public static void vehViolation() throws Exception{
		Map<String, String> info = new HashMap<String, String>();
		info.put("hphm", "鄂AQ953");
		info.put("hpzl", "16");
		info.put("wfxw", "10039");
		info.put("wfsj", "2018-08-01 10:00:00");
		info.put("wfdz", "武汉黄浦大街");

		String json = mapper.writeValueAsString(info);
		System.out.println(json);
		Map<String, String> params = Maps.newConcurrentMap();
		params.put("data", RSAUtils.encryptWithRSAByPublicKey(json));

		System.out.println(HttpUtil.post(baseUrl + "/api/vehViolation", params, "UTF-8"));
	}
}
