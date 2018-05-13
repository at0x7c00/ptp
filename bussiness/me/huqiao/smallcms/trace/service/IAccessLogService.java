package me.huqiao.smallcms.trace.service;
import java.util.Date;
import java.util.List;

import me.huqiao.smallcms.common.service.IBaseService;
import me.huqiao.smallcms.history.entity.HistoryRecord;
import me.huqiao.smallcms.sys.entity.User;
import me.huqiao.smallcms.trace.entity.AccessLog;
import me.huqiao.smallcms.trace.service.impl.PVSummary;
import me.huqiao.smallcms.trace.service.impl.RegionStat;
import me.huqiao.smallcms.util.web.Page;
/**
 * 访问日志Service接口
 * @author NOVOTS
 * @version Version 1.0
 */
public interface IAccessLogService extends IBaseService<AccessLog> {
    /**
     * 访问日志分页查询
     * @param accessLog 查询对象
     * @param pageInfo 分页查询对象
     * @return Page<AccessLog> 访问日志分页信息对象
     */
    public Page<AccessLog> getListPage(AccessLog accessLog,Page pageInfo);
	/**
	  * 访问日志历史记录分页查询
	  * @param accessLog 查询对象
	  * @param pageInfo 分页查询对象
	  * @return Page<HistoryRecord<AccessLog>> 访问日志历史分页信息对象
	  */
	public Page<HistoryRecord<AccessLog>> getHistoryListPage(AccessLog accessLog,Page pageInfo);
	/**
	 * 访问日志版本号查询
	 * @param version 查询版本号
	 * @return AccessLog 访问日志历史记录
	 */
	public AccessLog findByVersion(Integer version);
	/**
	 * 访问日志关键字查询
	 * @param  queryKey 关键字
	 * @param  pageInfo 分页查询对象
	 * @return Page<AccessLog> 访问日志分页信息对象
	 * 
	 */
	Page<AccessLog> queryByKey(String queryKey, Page<AccessLog> pageInfo);
	/**
	 * 查找多个访问日志
	 * @param ids id数组
	 * @return List<AccessLog> 访问日志列表
	 * 
	 */
	List<AccessLog> queryById(Integer[] ids);
	public boolean addLog(String ip, String id, String productId, String username,
			String page,String agent);
	public List<RegionStat> regionStat(Date start, Date end, User user,
			String productId);
	
	public PVSummary pvStat(Date start, Date end, User user,
			String productId);
	
	public PVSummary uvStat(Date start, Date end, User user,
			String productId);
}