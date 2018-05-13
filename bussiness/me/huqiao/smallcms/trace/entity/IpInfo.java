package me.huqiao.smallcms.trace.entity;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;



/**
 * {
	"code": 0,
	"data": {
		"ip": "0:0:0:0:0:0:0:1",
		"country": "XX",
		"area": "",
		"region": "XX",
		"city": "内网IP",
		"county": "内网IP",
		"isp": "内网IP",
		"country_id": "xx",
		"area_id": "",
		"region_id": "xx",
		"city_id": "local",
		"county_id": "local",
		"isp_id": "local"
	}
}
 * @author huqiao
 */
@JsonIgnoreProperties(ignoreUnknown = true)
public class IpInfo {
    private String code;
    private String msg;
    private IpInfoData data;
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public IpInfoData getData() {
		return data;
	}
	public void setData(IpInfoData data) {
		this.data = data;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
}
