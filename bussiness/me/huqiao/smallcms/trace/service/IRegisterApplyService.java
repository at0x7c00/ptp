package me.huqiao.smallcms.trace.service;
import java.util.List;

import me.huqiao.smallcms.common.service.IBaseService;
import me.huqiao.smallcms.history.entity.HistoryRecord;
import me.huqiao.smallcms.trace.entity.RegisterApply;
import me.huqiao.smallcms.util.web.Page;
/**
 * 注册申请Service接口
 * @author NOVOTS
 * @version Version 1.0
 */
public interface IRegisterApplyService extends IBaseService<RegisterApply> {
    /**
     * 注册申请分页查询
     * @param registerApply 查询对象
     * @param pageInfo 分页查询对象
     * @return Page<RegisterApply> 注册申请分页信息对象
     */
    public Page<RegisterApply> getListPage(RegisterApply registerApply,Page pageInfo);
	/**
	  * 注册申请历史记录分页查询
	  * @param registerApply 查询对象
	  * @param pageInfo 分页查询对象
	  * @return Page<HistoryRecord<RegisterApply>> 注册申请历史分页信息对象
	  */
	public Page<HistoryRecord<RegisterApply>> getHistoryListPage(RegisterApply registerApply,Page pageInfo);
	/**
	 * 注册申请版本号查询
	 * @param version 查询版本号
	 * @return RegisterApply 注册申请历史记录
	 */
	public RegisterApply findByVersion(Integer version);
	/**
	 * 注册申请关键字查询
	 * @param  queryKey 关键字
	 * @param  pageInfo 分页查询对象
	 * @return Page<RegisterApply> 注册申请分页信息对象
	 * 
	 */
	Page<RegisterApply> queryByKey(String queryKey, Page<RegisterApply> pageInfo);
	/**
	 * 查找多个注册申请
	 * @param ids id数组
	 * @return List<RegisterApply> 注册申请列表
	 * 
	 */
	List<RegisterApply> queryById(Integer[] ids);
}