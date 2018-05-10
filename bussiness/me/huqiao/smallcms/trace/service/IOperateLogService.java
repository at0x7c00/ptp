package me.huqiao.smallcms.trace.service;
import java.util.List;

import me.huqiao.smallcms.common.service.IBaseService;
import me.huqiao.smallcms.history.entity.HistoryRecord;
import me.huqiao.smallcms.trace.entity.OperateLog;
import me.huqiao.smallcms.util.web.Page;
/**
 * 访问日志Service接口
 * @author NOVOTS
 * @version Version 1.0
 */
public interface IOperateLogService extends IBaseService<OperateLog> {
    /**
     * 访问日志分页查询
     * @param operateLog 查询对象
     * @param pageInfo 分页查询对象
     * @return Page<OperateLog> 访问日志分页信息对象
     */
    public Page<OperateLog> getListPage(OperateLog operateLog,Page pageInfo);
	/**
	  * 访问日志历史记录分页查询
	  * @param operateLog 查询对象
	  * @param pageInfo 分页查询对象
	  * @return Page<HistoryRecord<OperateLog>> 访问日志历史分页信息对象
	  */
	public Page<HistoryRecord<OperateLog>> getHistoryListPage(OperateLog operateLog,Page pageInfo);
	/**
	 * 访问日志版本号查询
	 * @param version 查询版本号
	 * @return OperateLog 访问日志历史记录
	 */
	public OperateLog findByVersion(Integer version);
	/**
	 * 访问日志关键字查询
	 * @param  queryKey 关键字
	 * @param  pageInfo 分页查询对象
	 * @return Page<OperateLog> 访问日志分页信息对象
	 * 
	 */
	Page<OperateLog> queryByKey(String queryKey, Page<OperateLog> pageInfo);
	/**
	 * 查找多个访问日志
	 * @param ids id数组
	 * @return List<OperateLog> 访问日志列表
	 */
	List<OperateLog> queryById(Integer[] ids);
	
	public void addLog(String type, String ip, String operate, String description);
	
	public boolean timeValidate(String number,Long secondsAgo);
	
	public boolean ipValidate(String number, Integer ipLimitOfDay);
}