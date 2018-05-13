package me.huqiao.smallcms.trace.entity;
import java.util.Date;
import java.util.HashSet;
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
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.servlet.http.HttpServletRequest;

import me.huqiao.smallcms.common.entity.CommonFile;
import me.huqiao.smallcms.sys.entity.Department;
import me.huqiao.smallcms.sys.entity.User;
import me.huqiao.smallcms.trace.entity.enumtype.ProductStatus;
import me.huqiao.smallcms.util.Md5Util;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import com.fasterxml.jackson.annotation.JsonIgnore;
/**
 * 商品
 * @author NOVOTS
 * @version Version 1.0
 */
@Entity
@Table(name="trace_product")
@JsonIgnoreProperties( value={"hibernateLazyInitializer","handler"})
public class Product
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
/**名称*/
private String name;
/**品牌*/
private String brand;
/**所属类目*/
private Category category;
	/**所属类目模糊查询条件*/
private String categoryQuery;
/**商品图片*/
private CommonFile picture;
	/**商品图片模糊查询条件*/
private String pictureQuery;
/**详情*/
private String description;
/**规格*/
private String spec;
/**二维码*/
private CommonFile qrCode;
	/**二维码模糊查询条件*/
private String qrCodeQuery;
/**生产地*/
private String productAddr;
/**溯源追踪*/
private String trace;
/**有效期*/
private Date deadline;
	/**有效期开始，用于查询*/
private Date deadlineStart;
	/**有效期结束，用于查询*/
private Date deadlineEnd;
/**批号*/
private String batchNum;
/**执行标准*/
private String standard;
/**检验报告*/
private Set<CommonFile> checkPictures;
	/**检验报告临时集合*/
private List<CommonFile> checkPicturesList;
/**其他资质*/
private Set<CommonFile> otherQualifications;
private Set<ProductLog> logs;
	/**其他资质临时集合*/
private List<CommonFile> otherQualificationsList;
/**联系电话*/
private String tel;
/**状态*/
private ProductStatus status;
/**所属用户*/
private User creator;

private Long queryCount;

	/**所属用户模糊查询条件*/
private String creatorQuery;

	/**MD5管理ID*/
	protected String manageKey;
	
	private String uuid;
	
	/**@return String MD5管理ID */
	public String getManageKey() {
		return manageKey;
	}
	
	@Transient
	public String getCheckPicturesKeys(){
		String res = "";
		if(checkPictures!=null){
			for(CommonFile file : checkPictures){
				if(!res.equals("")){
					res += ",";
				}
				res += file.getManageKey();
			}
		}
		return res;
	}
	
	@Transient
	public String getOtherQualificationsKeys(){
		String res = "";
		if(otherQualifications!=null){
			for(CommonFile file : otherQualifications){
				if(!res.equals("")){
					res += ",";
				}
				res += file.getManageKey();
			}
		}
		return res;
	}
	
	/**
	 * @param manageKey 要设置的MD5管理ID 
	 */
	public void setManageKey(String manageKey) {
		this.manageKey = manageKey;
	}
/**
 * @param name 要设置的名称
 */
public void setName(String name){
    this.name = name;
}
/**
 * @return String 名称 
 */
@Column(name="name",length=255,nullable=true)
public String getName(){
		return this.name;	
}
/**
 * @param brand 要设置的品牌
 */
public void setBrand(String brand){
    this.brand = brand;
}
/**
 * @return String 品牌 
 */
@Column(name="bradn",length=255,nullable=true)
public String getBrand(){
		return this.brand;	
}
/**
 * @param category 要设置的所属类目
 */
public void setCategory(Category category){
    this.category = category;
}
/**
 * @param categoryQuery 要设置的所属类目模糊查询条件
 */
public void setCategoryQuery(String categoryQuery){
    this.categoryQuery = categoryQuery;
}
/**
 * @return Category 所属类目 
 */
@ManyToOne(targetEntity=me.huqiao.smallcms.trace.entity.Category.class,fetch=FetchType.LAZY)
@JoinColumn(name="category_id",nullable=true)
@Fetch(FetchMode.SELECT)
@JsonIgnore
public Category getCategory(){
		return this.category;	
}
/**
 * @return  String 所属类目模糊查询条件
 */
@Transient
public String getCategoryQuery(){
    return this.categoryQuery;
}
/**
 * @param picture 要设置的商品图片
 */
public void setPicture(CommonFile picture){
    this.picture = picture;
}
/**
 * @param pictureQuery 要设置的商品图片模糊查询条件
 */
public void setPictureQuery(String pictureQuery){
    this.pictureQuery = pictureQuery;
}
/**
 * @return CommonFile 商品图片 
 */
@ManyToOne(targetEntity=me.huqiao.smallcms.common.entity.CommonFile.class,fetch=FetchType.LAZY)
@JoinColumn(name="picture_id",nullable=true)
@Fetch(FetchMode.SELECT)
@JsonIgnore
public CommonFile getPicture(){
		return this.picture;	
}
/**
 * @return  String 商品图片模糊查询条件
 */
@Transient
public String getPictureQuery(){
    return this.pictureQuery;
}
/**
 * @param description 要设置的详情
 */
public void setDescription(String description){
    this.description = description;
}
/**
 * @return String 详情 
 */
@Column(name="description",length=255,columnDefinition="text",nullable=true)
public String getDescription(){
		return this.description;	
}
/**
 * @param spec 要设置的规格
 */
public void setSpec(String spec){
    this.spec = spec;
}
/**
 * @return String 规格 
 */
@Column(name="spec",length=255,nullable=true)
public String getSpec(){
		return this.spec;	
}
/**
 * @param qrCode 要设置的二维码
 */
public void setQrCode(CommonFile qrCode){
    this.qrCode = qrCode;
}
/**
 * @param qrCodeQuery 要设置的二维码模糊查询条件
 */
public void setQrCodeQuery(String qrCodeQuery){
    this.qrCodeQuery = qrCodeQuery;
}
/**
 * @return CommonFile 二维码 
 */
@ManyToOne(targetEntity=me.huqiao.smallcms.common.entity.CommonFile.class,fetch=FetchType.LAZY)
@JoinColumn(name="qr_code",nullable=true)
@Fetch(FetchMode.SELECT)
@JsonIgnore
public CommonFile getQrCode(){
		return this.qrCode;	
}
/**
 * @return  String 二维码模糊查询条件
 */
@Transient
public String getQrCodeQuery(){
    return this.qrCodeQuery;
}
/**
 * @param productAddr 要设置的生产地
 */
public void setProductAddr(String productAddr){
    this.productAddr = productAddr;
}
/**
 * @return String 生产地 
 */
@Column(name="product_addr",length=255,nullable=true)
public String getProductAddr(){
		return this.productAddr;	
}
/**
 * @param trace 要设置的溯源追踪
 */
public void setTrace(String trace){
    this.trace = trace;
}
/**
 * @return String 溯源追踪 
 */
@Column(name="_trace",length=255,nullable=true)
public String getTrace(){
		return this.trace;	
}
/**
 * @param deadline 要设置的有效期
 */
public void setDeadline(Date deadline){
    this.deadline = deadline;
}
/**
 * @return Date 有效期 
 */
@Column(name="deadline",nullable=true)
public Date getDeadline(){
		return this.deadline;	
}
/**
  * @param deadlineStart 要设置的有效期开始日期
  */
public void setDeadlineStart(Date deadlineStart){
    this.deadlineStart = deadlineStart;
}
/**
  * @return Date 有效期开始日期
  */
@Transient
public Date getDeadlineStart(){
    return this.deadlineStart;
}
/**
  * @param deadlineEnd 要设置的有效期结束日期
  */
public void setDeadlineEnd(Date deadlineEnd){
    this.deadlineEnd = deadlineEnd;
}
/**
  * @return Date 有效期结束日期
  */
@Transient
public Date getDeadlineEnd(){
    return this.deadlineEnd;
}
/**
 * @param batchNum 要设置的批号
 */
public void setBatchNum(String batchNum){
    this.batchNum = batchNum;
}
/**
 * @return String 批号 
 */
@Column(name="batch_num",length=255,nullable=true)
public String getBatchNum(){
		return this.batchNum;	
}
/**
 * @param standard 要设置的执行标准
 */
public void setStandard(String standard){
    this.standard = standard;
}
/**
 * @return String 执行标准 
 */
@Column(name="standard",length=255,nullable=true)
public String getStandard(){
		return this.standard;	
}
/**
 * @param checkPictures 要设置的检验报告
 */
public void setCheckPictures(Set<CommonFile> checkPictures){
    this.checkPictures = checkPictures;
}
/**
 * @return Set<CommonFile> 检验报告 
 */
@ManyToMany(targetEntity = CommonFile.class,fetch = FetchType.LAZY)
@JoinTable(name = "lnk_product_filee", joinColumns = { @JoinColumn(name = "product_id") }, inverseJoinColumns = { @JoinColumn(name = "filee_id") })
@Fetch(FetchMode.SELECT)
@OrderBy("id")
public Set<CommonFile> getCheckPictures(){
		return this.checkPictures;	
}
	/**
	 * @return  CommonFile 获取getCheckPictures对应的临时集合
	 */
	@Transient
	public List<CommonFile> getCheckPicturesList() {
		return checkPicturesList;
	}
	/**
	 * @param  checkPicturesList 要设置的检验报告对应的临时集合
	 */
	public void setCheckPicturesList(List<CommonFile> checkPicturesList) {
		this.checkPicturesList = checkPicturesList;
	}
	/**
	*  转换checkPictures对应的临时集合到Set中<br/>
	*  方法通过检查rowGuard的值，来过滤掉"空对象"
	 * @param HttpServletRequest request
	 */
	public void checkPicturesListToSet(HttpServletRequest request){
		if(checkPictures==null){
			checkPictures = new LinkedHashSet<CommonFile>();
		}else{
			checkPictures.clear();
		}
		if(checkPicturesList!=null){
			for(int i = 0;i<checkPicturesList.size();i++){
				String rowGuard = request.getParameter("rowGuard" + i);
				if(rowGuard==null || rowGuard.trim().equals("")){
					continue;
				}
				CommonFile tmpcommonFile = checkPicturesList.get(i);
				//tmpcommonFile.set(this);
				tmpcommonFile.setManageKey(Md5Util.getManageKey());
				checkPictures.add(tmpcommonFile);
			}
		}
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
@JoinTable(name = "lnk_product_filee_quali", joinColumns = { @JoinColumn(name = "product_id") }, inverseJoinColumns = { @JoinColumn(name = "filee_id") })
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
 * @param tel 要设置的联系电话
 */
public void setTel(String tel){
    this.tel = tel;
}
/**
 * @return String 联系电话 
 */
@Column(name="tel",length=255,nullable=true)
public String getTel(){
		return this.tel;	
}
/**
 * @param status 要设置的状态
 */
public void setStatus(ProductStatus status){
    this.status = status;
}
/**
 * @return ProductStatus 状态 
 */
@Column(name="status",nullable=true,columnDefinition="enum('UnSubmit','UnApprove','Failed','Success','Up','Down')")
@Enumerated(EnumType.STRING)
public ProductStatus getStatus(){
		return this.status;	
}
/**
 * @param creator 要设置的所属用户
 */
public void setCreator(User creator){
    this.creator = creator;
}
/**
 * @param creatorQuery 要设置的所属用户模糊查询条件
 */
public void setCreatorQuery(String creatorQuery){
    this.creatorQuery = creatorQuery;
}
/**
 * @return User 所属用户 
 */
@ManyToOne(targetEntity=me.huqiao.smallcms.sys.entity.User.class,fetch=FetchType.LAZY)
@JoinColumn(name="creator",nullable=true)
@Fetch(FetchMode.SELECT)
@JsonIgnore
public User getCreator(){
		return this.creator;	
}
/**
 * @return  String 所属用户模糊查询条件
 */
@Transient
public String getCreatorQuery(){
    return this.creatorQuery;
}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		Product other = null;
		try{
			other = (Product) obj;
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
		return "Product [manageKey=" + manageKey + "]";
	}
	
	@Column(name="_uuid",nullable = true)
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	
	@Transient
	public String getStatusStyle(){
		if(getStatus()==ProductStatus.UnSubmit){
			return "bg-color-blueDark";
		}else if(getStatus()==ProductStatus.UnApprove){
			return "bg-color-yellow";
		}else if(getStatus()==ProductStatus.Failed){
			return "bg-color-red";
		}else if(getStatus()==ProductStatus.Success){
			return "bg-color-green";
		}else if(getStatus()==ProductStatus.Down){
			return "bg-color-blueLight";
		}else if(getStatus()==ProductStatus.Up){
			return "bg-color-greenLight";
		}
		return "";
	}
	
	@Transient
	public boolean getCanUpdate(){
		return status == ProductStatus.UnSubmit || status==ProductStatus.Failed;
	}
	
	@Transient
	public boolean getCanCancel(){
		return status == ProductStatus.UnApprove;
	}
	
	@Transient
	public boolean getCanSubmit(){
		return status == ProductStatus.UnSubmit || status==ProductStatus.Failed;
	}
	
	@Transient
	public boolean getCanDown(){
		return status == ProductStatus.Up;
	}
	
	@Transient
	public boolean getCanUp(){
		return status == ProductStatus.Success || status == ProductStatus.Down;
	}
	
	@Transient
	public boolean getCanDownAndEdit(){
		return status == ProductStatus.Success || status == ProductStatus.Up || status == ProductStatus.Down;
	}
	
	@Transient
	public boolean getCanApprove(){
		return status == ProductStatus.UnApprove;
	}
	
	@OneToMany(targetEntity = ProductLog.class, mappedBy = "product", fetch = FetchType.LAZY)
	@Fetch(FetchMode.SELECT)
	@OrderBy("id")
	@Cascade(value = { CascadeType.DELETE, CascadeType.SAVE_UPDATE, CascadeType.DELETE_ORPHAN })
	@JsonIgnore
	public Set<ProductLog> getLogs() {
		return logs;
	}
	public void setLogs(Set<ProductLog> logs) {
		this.logs = logs;
	}
	
	@Transient
	public void addLog(String operator,String remark){
		ProductLog log = new ProductLog();
		log.setCreateDate(new Date());
		log.setOperator(operator);
		log.setRemark(remark);
		log.setProduct(this);
		if(logs==null){
			logs = new HashSet<ProductLog>();
		}
		logs.add(log);
	}
	
	@Column(name = "query_count",nullable = true)
	public Long getQueryCount() {
		return queryCount;
	}
	public void setQueryCount(Long queryCount) {
		this.queryCount = queryCount;
	}
	public void addQueryCount() {
		if(getQueryCount()==null){
			setQueryCount(1l);
		}else{
			setQueryCount(getQueryCount()+1);
		}
	}
	
}