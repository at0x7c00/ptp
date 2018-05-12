package me.huqiao.smallcms.trace.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="trace_product_log")
@JsonIgnoreProperties( value={"hibernateLazyInitializer","handler"})
public class ProductLog {

	protected Integer id;
	public void setId(Integer id){this.id=id;}
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(columnDefinition="integer")
	public Integer getId(){return this.id;}
	
	private String operator;
	private Date createDate;
	private String remark;
	private Product product;
	
	public String getOperator() {
		return operator;
	}

	public void setOperator(String operator) {
		this.operator = operator;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	@Column(name="remark",columnDefinition="text",nullable=true)
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	@ManyToOne(targetEntity = Product.class, fetch = FetchType.LAZY)
	@JoinColumn(name = "product_id", nullable = true)
	@Fetch(FetchMode.SELECT)
	@JsonIgnore
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	
}
