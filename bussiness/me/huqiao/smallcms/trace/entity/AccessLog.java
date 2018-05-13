package me.huqiao.smallcms.trace.entity;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import me.huqiao.smallcms.util.HttpUtil;
import me.huqiao.smallcms.util.JacksonUtil;

import org.apache.log4j.Logger;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
/**
 * 访问日志
 * @author NOVOTS
 * @version Version 1.0
 */
@Entity
@Table(name="trace_access_log")
@JsonIgnoreProperties( value={"hibernateLazyInitializer","handler"})
public class AccessLog{
	
	final static Logger log = Logger.getLogger(AccessLog.class);
	
	/**唯一识别ID号 */
	protected Integer id;
	/**@param id 要设置的唯一标示号*/
	public void setId(Integer id){this.id=id;}
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(columnDefinition="integer")
	/**@return Integer 唯一标示号*/
	public Integer getId(){return this.id;}
	/**IP*/
	private String ip;
	/**访问页面*/
	private String page;
	/**userID*/
	private String userID;
	/**访问时间*/
	private Date accessTime;
		/**访问时间开始，用于查询*/
	private Date accessTimeStart;
		/**访问时间结束，用于查询*/
	private Date accessTimeEnd;
	/**会话ID*/
	private String sessionID;
	
	private String productId;
	
	private String userAgent;
	private String country;
	private String region;
	private String city;
	private String isp;
	private String countryId;

	/**MD5管理ID*/
	protected String manageKey;
	/**@return String MD5管理ID */
	public String getManageKey() {
		return manageKey;
	}
	/**
	 * @param manageKey 要设置的MD5管理ID 
	 */
	public void setManageKey(String manageKey) {
		this.manageKey = manageKey;
	}
/**
 * @param ip 要设置的IP
 */
public void setIp(String ip){
    this.ip = ip;
}
/**
 * @return String IP 
 */
@Column(name="ip",length=255,nullable=true)
public String getIp(){
		return this.ip;	
}
/**
 * @param page 要设置的访问页面
 */
public void setPage(String page){
    this.page = page;
}
/**
 * @return String 访问页面 
 */
@Column(name="page",length=255,nullable=true)
public String getPage(){
		return this.page;	
}
/**
 * @param userID ��设置的userID
 */
public void setUserID(String userID){
    this.userID = userID;
}
/**
 * @return String userID 
 */
@Column(name="user_id",length=255,nullable=true)
public String getUserID(){
		return this.userID;	
}
/**
 * @param accessTime 要设置的访问时间
 */
public void setAccessTime(Date accessTime){
    this.accessTime = accessTime;
}
/**
 * @return Date 访问时间 
 */
@Column(name="access_time",nullable=true)
public Date getAccessTime(){
		return this.accessTime;	
}
/**
  * @param accessTimeStart 要设置的访问时间开始日期
  */
public void setAccessTimeStart(Date accessTimeStart){
    this.accessTimeStart = accessTimeStart;
}
/**
  * @return Date 访问时间开始日期
  */
@Transient
public Date getAccessTimeStart(){
    return this.accessTimeStart;
}
/**
  * @param accessTimeEnd 要设置的访问时间结束日期
  */
public void setAccessTimeEnd(Date accessTimeEnd){
    this.accessTimeEnd = accessTimeEnd;
}
/**
  * @return Date 访问时间结束日期
  */
@Transient
public Date getAccessTimeEnd(){
    return this.accessTimeEnd;
}
/**
 * @param sessionID 要设置的会话ID
 */
public void setSessionID(String sessionID){
    this.sessionID = sessionID;
}
/**
 * @return String 会话ID 
 */
@Column(name="session_id",length=255,nullable=true)
public String getSessionID(){
		return this.sessionID;	
}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		AccessLog other = null;
		try{
			other = (AccessLog) obj;
		}catch(Exception e){
			return false;
		}
		if (manageKey == null) {
			if (other.getManageKey() != null)
				return false;
		} else if (!manageKey.equals(other.getManageKey()))
			return false;
		return true;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((manageKey == null) ? 0 : manageKey.hashCode());
		return result;
	}
	@Override
	public String toString() {
		return "AccessLog [manageKey=" + manageKey + "]";
	}
	
	@Column(name = "product_id",nullable = true)
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	
	@Column(name = "user_agent",nullable = true)
	public String getUserAgent() {
		return userAgent;
	}
	public void setUserAgent(String userAgent) {
		this.userAgent = userAgent;
	}
	
	@Column(name = "country",nullable = true)
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	@Column(name = "_region",nullable = true)
	public String getRegion() {
		return region;
	}
	
	public void setRegion(String region) {
		this.region = region;
	}
	
	@Column(name = "city",nullable = true)
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	
	@Column(name = "isp",nullable = true)
	public String getIsp() {
		return isp;
	}
	public void setIsp(String isp) {
		this.isp = isp;
	}
	
	@Column(name = "country_id",nullable = true)
	public String getCountryId() {
		return countryId;
	}
	public void setCountryId(String countryId) {
		this.countryId = countryId;
	}
	final static String ipInfoUrl = "http://ip.taobao.com/service/getIpInfo.php?ip=";
	public void parsePositionInfos() {
		
		String ipInfoJson = null;
		try{
			ipInfoJson = HttpUtil.getRequest(ipInfoUrl + this.ip);
		}catch(Exception e){
			log.error("Cannot get ipinfo from api:" + ipInfoUrl);
			return;
		}
		try{
			IpInfo info = null;
			info = (IpInfo) JacksonUtil.transfer(ipInfoJson, IpInfo.class);
			IpInfoData data = info.getData();
			if(data!=null){
				this.country = data.getCountry();
				this.region = data.getRegion();
				this.city = data.getCity();
				this.isp = data.getIsp();
				this.countryId = data.getCountry_id();
			}
		}catch(Exception e){
			log.error("Unable to parse ip info:from " + ipInfoJson + " to Info object:" + e.getMessage());
		}
	}
	
}