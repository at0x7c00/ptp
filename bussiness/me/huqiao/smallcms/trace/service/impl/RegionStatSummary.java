package me.huqiao.smallcms.trace.service.impl;

import java.util.List;

public class RegionStatSummary {
	private Integer total = 0;
	private Integer max = 0;
	private Integer min = 0;
	private Integer average = 0;

	private List<RegionStat> regionStatList;

	public RegionStatSummary(List<RegionStat> regionStatList) {
		this.regionStatList = regionStatList;
	}
	
	public RegionStatSummary calcute(){
		for(RegionStat stat : regionStatList){
			if(stat!=null){
				if(stat.getValue()>max){
					max = stat.getValue();
				}
				if(stat.getValue()<min){
					min = stat.getValue();
				}
				total += stat.getValue();
			}
		}
		if(regionStatList.size()>0){
			average = total / regionStatList.size();
		}
		return this;
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

	public List<RegionStat> getRegionStatList() {
		return regionStatList;
	}

	public void setRegionStatList(List<RegionStat> regionStatList) {
		this.regionStatList = regionStatList;
	}
	
	public Integer getMaxValue(){
		int i = 0;
		while(i*100<max){
			i++;
		}
		i = i*100;
		if(i<100){
			i = 100;
		}
		return i;
	}
}
