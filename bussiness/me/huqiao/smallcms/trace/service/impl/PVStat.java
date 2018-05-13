package me.huqiao.smallcms.trace.service.impl;

public class PVStat {

	private String day;
	private Integer value;
	
	public PVStat(String day, Integer value) {
		this.day = day;
		this.value = value;
	}
	
	public PVStat(String day, Long value) {
		this.day = day;
		this.value = value.intValue();
	}
	
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public Integer getValue() {
		return value;
	}
	public void setValue(Integer value) {
		this.value = value;
	}
}
