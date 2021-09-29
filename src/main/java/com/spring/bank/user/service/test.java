package com.spring.bank.user.service;

import java.io.IOException;

import org.jsoup.Jsoup;

import com.fasterxml.jackson.databind.ObjectMapper;

public class test {
	public static void main(String[] args) throws IOException {
		String strJson = Jsoup.connect("http://fx.kebhana.com/FER1101M.web").get().select("body").text().replaceAll("},] }", "} ]");
		strJson = strJson.substring(strJson.indexOf("["));
		ObjectMapper mapper = new ObjectMapper();

		String jsonStr = mapper.writeValueAsString(strJson);
		String json1 = jsonStr.substring(0,3472);
		String json2 = jsonStr.substring(3473, 7013);
		
		json1 = strJson.substring(0,3472);
		json2 = strJson.substring(3473, 7013);
		String jsonStr1 = mapper.writeValueAsString(json1);
		System.out.println(json1);
		
	}

}
