package me.huqiao.smallcms.trace.service.impl;

import java.util.HashMap;
import java.util.Map;

public class RegionStat {

	public final static Map<String,String> nameIdMap = new HashMap<String,String>();
	static {
		nameIdMap.put("安徽","CN.AH");
		nameIdMap.put("北京","CN.BJ");
		nameIdMap.put("重庆","CN.CQ");
		nameIdMap.put("福建","CN.FJ");
		nameIdMap.put("甘肃","CN.GS");
		nameIdMap.put("广东","CN.GD");
		nameIdMap.put("广西","CN.GX");
		nameIdMap.put("贵州","CN.GZ");
		nameIdMap.put("海南","CN.HA");
		nameIdMap.put("河北","CN.HB");
		nameIdMap.put("黑龙江","CN.HL");
		nameIdMap.put("河南","CN.HE");
		nameIdMap.put("香港","CN.HK");
		nameIdMap.put("湖北","CN.HU");
		nameIdMap.put("湖南","CN.HN");
		nameIdMap.put("江苏","CN.JS");
		nameIdMap.put("江西","CN.JX");
		nameIdMap.put("吉林","CN.JL");
		nameIdMap.put("辽宁","CN.LN");
		nameIdMap.put("澳门","CN.MA");
		nameIdMap.put("内蒙","CN.NM");
		nameIdMap.put("宁夏","CN.NX");
		nameIdMap.put("青海","CN.QH");
		nameIdMap.put("陕西","CN.SA");
		nameIdMap.put("山东","CN.SD");
		nameIdMap.put("上海","CN.SH");
		nameIdMap.put("山西","CN.SX");
		nameIdMap.put("四川","CN.SC");
		nameIdMap.put("台湾","CN.TA");
		nameIdMap.put("天津","CN.TJ");
		nameIdMap.put("西藏","CN.XZ");
		nameIdMap.put("新疆","CN.XJ");
		nameIdMap.put("云南","CN.YN");
		nameIdMap.put("浙江","CN.ZJ");
	}
	private String id;
	private Integer value;
	private String name;
	
	public RegionStat(String id, Integer value) {
		this.name = id;
		this.id = nameIdMap.get(id);
		this.value = value;
	}
	public RegionStat(String id, Long value) {
		this.name = id;
		this.id = nameIdMap.get(id);
		this.value = value.intValue();
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Integer getValue() {
		return value;
	}
	public void setValue(Integer value) {
		this.value = value;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
}
