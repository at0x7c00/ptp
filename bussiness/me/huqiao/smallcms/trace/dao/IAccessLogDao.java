package me.huqiao.smallcms.trace.dao;
import java.util.List;

import me.huqiao.smallcms.common.dao.IBaseDao;
import me.huqiao.smallcms.history.entity.HistoryRecord;
import me.huqiao.smallcms.trace.entity.AccessLog;
import me.huqiao.smallcms.util.web.Page;

import org.hibernate.Criteria;
/**
 * 访问日志DAO接口
 * @author NOVOTS
 * @version Version 1.0
 */
public interface IAccessLogDao extends IBaseDao<AccessLog> {
    /**
     * 访问日志查询记录数量
     * @param accessLog 查询对象
     * @return Long 记录数量
     */
	Long findListRowCount(AccessLog accessLog);
	/**
	 * 访问日志历史记录数量
     * @param accessLog 查询对象
     * @param pageInfo 分页查询对象
	 * @return Long 历史记录数量
     */
	Long findHistoryListRowCount(AccessLog accessLog,Page pageInfo);
    /**
     * 访问日志分页查询
     * @param accessLog 查询对象
     * @param pageInfo 分页查询对象
     * @return  List<AccessLog>  访问日志列表 
     */
    List<AccessLog> findListPage(AccessLog accessLog, Page pageInfo);
	/**
	 * 访问日志历史记录分页查询
     * @param accessLog 查询对象
     * @param pageInfo 分页查询对象
     * @return List<HistoryRecord<AccessLog>>  访问日志历史列表
	 */
    List<HistoryRecord<AccessLog>> findHistoryListPage(AccessLog accessLog, Page pageInfo);
	/**
     * 访问日志版本号查询
     * @param version 版本号
	 * @return AccessLog 访问日志历史记录
     */
	AccessLog findByVersion(Integer version);
	/**
	 * 添加访问日志查询条件
	 * @param criteria Hibernate Criteria对象
	 * @param accessLog 查询对象
	 */
	public void queryCause(Criteria criteria, AccessLog accessLog);
	/**
	 * 访问日志关键字查询
	 * @param  queryKey 查询关键字
	 * @return List<AccessLog> 访问日志列表
	 */
	List<AccessLog> findByKey(Page pageInfo,String queryKey);
	/**
	 * 访问日志关键字查询数量
	 * @param queryKey 查询关键字
	 * @return Long 记录数量
	 */
	Long findRowCount(String queryKey);
    /**
     * 查找多个访问日志
     * @param  ids id数组
	 * @return List<AccessLog>  访问日志列表
     */
	List<AccessLog> findById(Integer[] ids);
}