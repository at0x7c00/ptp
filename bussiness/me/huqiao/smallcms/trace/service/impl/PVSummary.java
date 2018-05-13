package me.huqiao.smallcms.trace.service.impl;

import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import me.huqiao.smallcms.util.DateUtil;

public class PVSummary {
	
	private List<PVStat> pvStatList;
	private Integer total = 0;
	private Integer max = 0;
	private Integer min = 0;
	private Integer average = 0;

	public PVSummary(List<PVStat> pvStatList) {
		this.pvStatList = pvStatList;
	}
	
	public PVSummary calcute(Date start,Date end){
		Map<String,PVStat> mapper = new HashMap<String,PVStat>();
		for(PVStat stat : pvStatList){
			mapper.put(stat.getDay(), stat);
		}
		int dayCount = 0;
		while(start.before(end)){
			dayCount++;
			String day = DateUtil.formatDate(start,"yyyy-MM-dd");
			PVStat stat = mapper.get(day);
			if(stat!=null){
				if(stat.getValue()>max){
					max = stat.getValue();
				}
				if(stat.getValue()<min){
					min = stat.getValue();
				}
				total += stat.getValue();
			}
			start = DateUtil.datePlus(start, Calendar.DAY_OF_MONTH, 1);
		}
		if(dayCount>0){
			average = total / dayCount;
		}
		return this;
	}
	
	public List<PVStat> getPvStatList() {
		return pvStatList;
	}

	public void setPvStatList(List<PVStat> pvStatList) {
		this.pvStatList = pvStatList;
	}

	public Integer getTotal() {
		return total;
	}

	public void setTotal(Integer total) {
		this.total = total;
	}

	public Integer getMax() {
		return max;
	}

	public void setMax(Integer max) {
		this.max = max;
	}

	public Integer getMin() {
		return min;
	}

	public void setMin(Integer min) {
		this.min = min;
	}

	public Integer getAverage() {
		return average;
	}

	public void setAverage(Integer average) {
		this.average = average;
	}
}
