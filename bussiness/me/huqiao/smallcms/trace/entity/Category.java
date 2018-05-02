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
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.servlet.http.HttpServletRequest;

import me.huqiao.smallcms.sys.entity.enumtype.YesNo;
import me.huqiao.smallcms.util.Md5Util;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import com.fasterxml.jackson.annotation.JsonIgnore;
/**
 * 类目
 * @author NOVOTS
 * @version Version 1.0
 */
@Entity
@Table(name="trace_category")
@JsonIgnoreProperties( value={"hibernateLazyInitializer","handler"})
public class Category
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
/**排序号*/
private Integer orderNum;
	/**排序号开始，用于查询*/
private Integer orderNumStart;
	/**排序号结束，用于查询*/
private Integer orderNumEnd;
/**状态*/
private YesNo status;
/**备注*/
private String remark;
/**父级*/
private Category parent;
	/**父��模糊查询条件*/
private String parentQuery;
/**子级类目*/
private Set<Category> children;
	/**子级类目临时集合*/
private List<Category> childrenList;
/**名称*/
private String name;
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
 * @param orderNum 要设置的排序号
 */
public void setOrderNum(Integer orderNum){
    this.orderNum = orderNum;
}
/**
 * @return Integer 排序号 
 */
@Column(name="order_num",nullable=true)
public Integer getOrderNum(){
		return this.orderNum;	
}
/**
  * @param orderNumStart 要设置的排序号开始日期
  */
public void setOrderNumStart(Integer orderNumStart){
    this.orderNumStart = orderNumStart;
}
/**
  * @return Integer 排序号开始日期
  */
@Transient
public Integer getOrderNumStart(){
    return this.orderNumStart;
}
/**
  * @param orderNumEnd 要设置的排序号结束日期
  */
public void setOrderNumEnd(Integer orderNumEnd){
    this.orderNumEnd = orderNumEnd;
}
/**
  * @return Integer 排序号结束日期
  */
@Transient
public Integer getOrderNumEnd(){
    return this.orderNumEnd;
}
/**
 * @param status 要设置的状态
 */
public void setStatus(YesNo status){
    this.status = status;
}
/**
 * @return YesNo 状态 
 */
@Column(name="status",nullable=true,columnDefinition="enum('Yes','No')")
@Enumerated(EnumType.STRING)
public YesNo getStatus(){
		return this.status;	
}
/**
 * @param remark 要设置的备注
 */
public void setRemark(String remark){
    this.remark = remark;
}
/**
 * @return String 备注 
 */
@Column(name="remark",length=255,columnDefinition="text",nullable=true)
public String getRemark(){
		return this.remark;	
}
/**
 * @param parent 要设置的父级
 */
public void setParent(Category parent){
    this.parent = parent;
}
/**
 * @param parentQuery 要设置的父级模糊查询条件
 */
public void setParentQuery(String parentQuery){
    this.parentQuery = parentQuery;
}
/**
 * @return Category 父级 
 */
@ManyToOne(targetEntity=me.huqiao.smallcms.trace.entity.Category.class,fetch=FetchType.LAZY)
@JoinColumn(name="parent_id",nullable=true)
@Fetch(FetchMode.SELECT)
@JsonIgnore
public Category getParent(){
		return this.parent;	
}
/**
 * @return  String 父级模糊查询条件
 */
@Transient
public String getParentQuery(){
    return this.parentQuery;
}
/**
 * @param children 要设置的子级类目
 */
public void setChildren(Set<Category> children){
    this.children = children;
}
/**
 * @return Set<Category> 子级类目 
 */
@OneToMany(targetEntity=me.huqiao.smallcms.trace.entity.Category.class,mappedBy="parent",fetch=FetchType.LAZY)
@Cascade(value = {CascadeType.SAVE_UPDATE,CascadeType.DELETE_ORPHAN})
@JsonIgnore
@OrderBy("orderNum,id")
public Set<Category> getChildren(){
		return this.children;	
}
	/**
	 * @return  Category 获取getChildren对应的临时集合
	 */
	@Transient
	public List<Category> getChildrenList() {
		return childrenList;
	}
	/**
	 * @param  childrenList 要设置的子级类目对应的临时集合
	 */
	public void setChildrenList(List<Category> childrenList) {
		this.childrenList = childrenList;
	}
	/**
	*  转换children对应的临时集合到Set中<br/>
	*  方法通过检查rowGuard的值，来过滤掉"空对象"
	 * @param HttpServletRequest request
	 */
	public void childrenListToSet(HttpServletRequest request){
		if(children==null){
			children = new LinkedHashSet<Category>();
		}else{
			children.clear();
		}
		if(childrenList!=null){
			for(int i = 0;i<childrenList.size();i++){
				String rowGuard = request.getParameter("rowGuard" + i);
				if(rowGuard==null || rowGuard.trim().equals("")){
					continue;
				}
				Category tmpcategory = childrenList.get(i);
				tmpcategory.setParent(this);
				tmpcategory.setManageKey(Md5Util.getManageKey());
				children.add(tmpcategory);
			}
		}
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
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		Category other = null;
		try{
			other = (Category) obj;
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
		return "Category [manageKey=" + manageKey + "]";
	}
	
	@Transient
	public String getFullName(){
		String name = this.name;
		Category parent = this.parent;
		int count = 30;
		while(parent!=null){
			name = parent.name + "-" + name;
			parent = parent.parent;
		}
		return name;
	}
}