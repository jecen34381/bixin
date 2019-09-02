package com.bixin.utils;
import java.util.UUID;
public class CommonUtils {
	public static String getUUID() {//生成一个随机id号的方法吗，据说是一百亿年也不会生成重复的
		String uuid = UUID.randomUUID().toString();
		uuid = uuid.replace("-", "");//把—去掉 
		return uuid;
	}
}
