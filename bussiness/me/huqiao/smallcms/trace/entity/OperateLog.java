package me.huqiao.smallcms.trace.entity;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;
/**
 * 操作日志
 * @author NOVOTS
 * @version Version 1.0
 */
@Entity
@Table(name="trace_operate_log")
@JsonIgnoreProperties( value={"hibernateLazyInitializer","handler"})
public class OperateLog{
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
	private String description;
	private String operate;
	private String type;
	private String userID;
	private Date operateTime;
	private Date operateTimeStart;
	private Date operateTimeEnd;
	private String sessionID;

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
		OperateLog other = null;
		try{
			other = (OperateLog) obj;
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
	
	@Column(name = "description",nullable=true)
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	@Column(name = "operate_time",nullable = true)
	public Date getOperateTime() {
		return operateTime;
	}
	public void setOperateTime(Date operateTime) {
		this.operateTime = operateTime;
	}
	
	@Column(name = "type",nullable = true)
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	@Transient
	public Date getOperateTimeStart() {
		return operateTimeStart;
	}
	public void setOperateTimeStart(Date operateTimeStart) {
		this.operateTimeStart = operateTimeStart;
	}
	@Transient
	public Date getOperateTimeEnd() {
		return operateTimeEnd;
	}
	public void setOperateTimeEnd(Date operateTimeEnd) {
		this.operateTimeEnd = operateTimeEnd;
	}
	public String getOperate() {
		return operate;
	}
	public void setOperate(String operate) {
		this.operate = operate;
	}
}