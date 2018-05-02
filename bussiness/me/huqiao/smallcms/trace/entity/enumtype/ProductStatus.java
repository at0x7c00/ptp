package me.huqiao.smallcms.trace.entity.enumtype;
import java.util.LinkedHashMap;
import java.util.Map;
/**
 * 商品状态<br>  UnApprove("待审核"),Failed("审核失败"),Success("审核成功"),Down("下架");
 * @author NOVOTS
 * @version Version 1.0
 */
public enum ProductStatus{
    UnApprove("待审核"),Failed("审核失败"),Success("审核成功"),Down("下架");
 /**  description 描述信息*/
    private String description;
    private ProductStatus(String description){this.description = description;}
    /**
	  *  获取描述信息
      * @return String 描述信息
	  */
    public String getDescription(){return description;}
    /**
	  * 枚举对象-描述信息 键值对
      * @return Map<ProductStatus,String> 枚举对象-描述信息 键值对
	  */
    public final static Map<ProductStatus,String> productStatusMap = new LinkedHashMap<ProductStatus,String>();
    static{
        for(ProductStatus s : ProductStatus.values()){
          productStatusMap.put(s,s.getDescription());  
        }
    }
}