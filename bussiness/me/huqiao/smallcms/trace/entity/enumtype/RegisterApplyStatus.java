package me.huqiao.smallcms.trace.entity.enumtype;
import java.util.LinkedHashMap;
import java.util.Map;
/**
 * 注册申请状态<br>  UnDeal("未处理"),Failed("审核失败"),Succes("审核成功");
 * @author NOVOTS
 * @version Version 1.0
 */
public enum RegisterApplyStatus{
    UnDeal("未处理"),Failed("审核失败"),Succes("审核成功");
 /**  description 描述信息*/
    private String description;
    private RegisterApplyStatus(String description){this.description = description;}
    /**
	  *  获取描述信息
      * @return String 描述信息
	  */
    public String getDescription(){return description;}
    /**
	  * 枚举对象-描述信息 键值对
      * @return Map<RegisterApplyStatus,String> 枚举对象-描述信息 键值对
	  */
    public final static Map<RegisterApplyStatus,String> registerApplyStatusMap = new LinkedHashMap<RegisterApplyStatus,String>();
    static{
        for(RegisterApplyStatus s : RegisterApplyStatus.values()){
          registerApplyStatusMap.put(s,s.getDescription());  
        }
    }
}