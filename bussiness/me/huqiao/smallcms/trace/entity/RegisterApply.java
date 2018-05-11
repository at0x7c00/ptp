package me.huqiao.smallcms.trace.entity;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OrderBy;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.servlet.http.HttpServletRequest;

import me.huqiao.smallcms.common.entity.CommonFile;
import me.huqiao.smallcms.trace.entity.enumtype.RegisterApplyStatus;
import me.huqiao.smallcms.util.Md5Util;
import me.huqiao.smallcms.util.StringUtil;
import me.huqiao.smallcms.util.web.JsonResult;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import com.fasterxml.jackson.annotation.JsonIgnore;
/**
 * 注册申请
 * @author NOVOTS
 * @version Version 1.0
 */
@Entity
@Table(name="trace_register_apply")
@JsonIgnoreProperties( value={"hibernateLazyInitializer","handler"})
public class RegisterApply
{
/**唯一识别ID号 */
protected Integer id;
	/**@param id 要设置的唯一标示号*/
public void setId(Integer id){this.id=id;}
@Id
@GeneratedValue(strategy=GenerationType.AUTO)
@Column(columnDefinition="integer")
	/**@return Integer 唯一标示号*/
public Integer getId(){return this.id;}
/**法人*/
private String lawPerson;
/**公司地址*/
private String address;
/**联系人*/
private String contact;
/**公司名称*/
private String name;
/**联系电话*/
private String telq;
/**邮箱*/
private String email;
/**营业执照*/
private CommonFile license;
	/**营业执照模糊查询条件*/
private String licenseQuery;
/**法人身份证*/
private CommonFile lawPersonIDCard;
	/**法人身份证模糊查询条件*/
private String lawPersonIDCardQuery;
/**其他资质*/
private Set<CommonFile> otherQualifications;
	/**其他资质临时集合*/
private List<CommonFile> otherQualificationsList;
/**状态*/
private RegisterApplyStatus status;
/**处理备注*/
private String dealRemak;
	/**MD5管理ID*/
	protected String manageKey;
	
	private String username;
	private String password;
	private String mobileNumber;
	
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
 * @param lawPerson 要设置的法人
 */
public void setLawPerson(String lawPerson){
    this.lawPerson = lawPerson;
}
/**
 * @return String 法人 
 */
@Column(name="law_person",length=255,nullable=true)
public String getLawPerson(){
		return this.lawPerson;	
}
/**
 * @param address 要设置的公司地址
 */
public void setAddress(String address){
    this.address = address;
}
/**
 * @return String 公司地址 
 */
@Column(name="address",length=255,nullable=true)
public String getAddress(){
		return this.address;	
}
/**
 * @param contact 要设置的联系人
 */
public void setContact(String contact){
    this.contact = contact;
}
/**
 * @return String 联系人 
 */
@Column(name="_contact",length=255,nullable=true)
public String getContact(){
		return this.contact;	
}
/**
 * @param name 要设置的公司名称
 */
public void setName(String name){
    this.name = name;
}
/**
 * @return String 公司名称 
 */
@Column(name="name",length=255,nullable=true)
public String getName(){
		return this.name;	
}
/**
 * @param telq 要设置的联系电话
 */
public void setTelq(String telq){
    this.telq = telq;
}
/**
 * @return String 联系电话 
 */
@Column(name="tel",length=255,nullable=true)
public String getTelq(){
		return this.telq;	
}
/**
 * @param email 要设置的邮箱
 */
public void setEmail(String email){
    this.email = email;
}
/**
 * @return String 邮箱 
 */
@Column(name="email",length=255,nullable=true)
public String getEmail(){
		return this.email;	
}
/**
 * @param license 要设置的营业执照
 */
public void setLicense(CommonFile license){
    this.license = license;
}
/**
 * @param licenseQuery 要设置的营业执照模糊查询条件
 */
public void setLicenseQuery(String licenseQuery){
    this.licenseQuery = licenseQuery;
}
/**
 * @return CommonFile 营业执照 
 */
@ManyToOne(targetEntity=me.huqiao.smallcms.common.entity.CommonFile.class,fetch=FetchType.LAZY)
@JoinColumn(name="license",nullable=true)
@Fetch(FetchMode.SELECT)
@JsonIgnore
public CommonFile getLicense(){
		return this.license;	
}
/**
 * @return  String 营业执照模糊查询条件
 */
@Transient
public String getLicenseQuery(){
    return this.licenseQuery;
}
/**
 * @param lawPersonIDCard 要设置的法人身份证
 */
public void setLawPersonIDCard(CommonFile lawPersonIDCard){
    this.lawPersonIDCard = lawPersonIDCard;
}
/**
 * @param lawPersonIDCardQuery 要设置的法人身份证模糊查询条件
 */
public void setLawPersonIDCardQuery(String lawPersonIDCardQuery){
    this.lawPersonIDCardQuery = lawPersonIDCardQuery;
}
/**
 * @return CommonFile 法人身份证 
 */
@ManyToOne(targetEntity=me.huqiao.smallcms.common.entity.CommonFile.class,fetch=FetchType.LAZY)
@JoinColumn(name="id_card",nullable=true)
@Fetch(FetchMode.SELECT)
@JsonIgnore
public CommonFile getLawPersonIDCard(){
		return this.lawPersonIDCard;	
}
/**
 * @return  String 法人身份证模糊查询条件
 */
@Transient
public String getLawPersonIDCardQuery(){
    return this.lawPersonIDCardQuery;
}
/**
 * @param otherQualifications 要设置的其他资质
 */
public void setOtherQualifications(Set<CommonFile> otherQualifications){
    this.otherQualifications = otherQualifications;
}
/**
 * @return Set<CommonFile> 其他资质 
 */
@ManyToMany(targetEntity = CommonFile.class,fetch = FetchType.LAZY)
@JoinTable(name = "lnk_regist_apply_filee_quali", joinColumns = { @JoinColumn(name = "apply_id") }, inverseJoinColumns = { @JoinColumn(name = "filee_id") })
@Fetch(FetchMode.SELECT)
@OrderBy("id")
public Set<CommonFile> getOtherQualifications(){
		return this.otherQualifications;	
}
	/**
	 * @return  CommonFile 获取getOtherQualifications对应的临时集合
	 */
	@Transient
	public List<CommonFile> getOtherQualificationsList() {
		return otherQualificationsList;
	}
	/**
	 * @param  otherQualificationsList 要设置的其他资质对应的临时集合
	 */
	public void setOtherQualificationsList(List<CommonFile> otherQualificationsList) {
		this.otherQualificationsList = otherQualificationsList;
	}
	/**
	*  转换otherQualifications对应的临时集合到Set中<br/>
	*  方法通过检查rowGuard的值，来过滤掉"空对象"
	 * @param HttpServletRequest request
	 */
	public void otherQualificationsListToSet(HttpServletRequest request){
		if(otherQualifications==null){
			otherQualifications = new LinkedHashSet<CommonFile>();
		}else{
			otherQualifications.clear();
		}
		if(otherQualificationsList!=null){
			for(int i = 0;i<otherQualificationsList.size();i++){
				String rowGuard = request.getParameter("rowGuard" + i);
				if(rowGuard==null || rowGuard.trim().equals("")){
					continue;
				}
				CommonFile tmpcommonFile = otherQualificationsList.get(i);
				//tmpcommonFile.set(this);
				tmpcommonFile.setManageKey(Md5Util.getManageKey());
				otherQualifications.add(tmpcommonFile);
			}
		}
	}
/**
 * @param status 要设置的状态
 */
public void setStatus(RegisterApplyStatus status){
    this.status = status;
}
/**
 * @return RegisterApplyStatus 状态 
 */
@Column(name="status",nullable=true,columnDefinition="enum('UnDeal','Failed','Succes')")
@Enumerated(EnumType.STRING)
public RegisterApplyStatus getStatus(){
		return this.status;	
}
/**
 * @param dealRemak 要设置的处理备注
 */
public void setDealRemak(String dealRemak){
    this.dealRemak = dealRemak;
}
/**
 * @return String 处理备注 
 */
@Column(name="deal_remak",length=255,columnDefinition="text",nullable=true)
public String getDealRemak(){
		return this.dealRemak;	
}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		RegisterApply other = null;
		try{
			other = (RegisterApply) obj;
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
		return "RegisterApply [manageKey=" + manageKey + "]";
	}
	@Column(name = "username",nullable = true)
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	@Column(name = "password",nullable = true)
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Column(name = "mobile_number",nullable = true)
	public String getMobileNumber() {
		return mobileNumber;
	}
	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}
	
	public JsonResult baseDataValidate() {
		StringBuffer msg = new StringBuffer();
		boolean success = true;
		
		success = success & StringUtil.lengthValidate(name, 50,msg,"公司名称");
		success = success & StringUtil.lengthValidate(lawPerson, 20,msg,"公司法人");
		success = success & StringUtil.lengthValidate(address, 50,msg,"公司地址");
		success = success & StringUtil.lengthValidate(contact, 50,msg,"联系人");
		success = success & StringUtil.lengthValidate(telq, 20,msg,"联系电话");
		success = success & StringUtil.lengthValidate(name, 50,msg,"公司名称");
		
		success = success & StringUtil.emailValidate(email,msg,"E-mail");
		success = success & StringUtil.usernameValidate(username,msg,"用户名");
		success = success & StringUtil.passwordValidate(password,msg,"密码");
		success = success & StringUtil.mobileNumberValidate(mobileNumber,msg,"手机号");
		
		return success ? JsonResult.success(msg.toString()) : JsonResult.error(msg.toString());
		
	}
	
}