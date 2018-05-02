package me.huqiao.smallcms.trace.dao;
import java.util.List;

import me.huqiao.smallcms.common.dao.IBaseDao;
import me.huqiao.smallcms.history.entity.HistoryRecord;
import me.huqiao.smallcms.trace.entity.RegisterApply;
import me.huqiao.smallcms.util.web.Page;

import org.hibernate.Criteria;
/**
 * 注册申请DAO接口
 * @author NOVOTS
 * @version Version 1.0
 */
public interface IRegisterApplyDao extends IBaseDao<RegisterApply> {
    /**
     * 注册申请查询记录数量
     * @param registerApply 查询对象
     * @return Long 记录数量
     */
	Long findListRowCount(RegisterApply registerApply);
	/**
	 * 注册申请历史记录数量
     * @param registerApply 查询对象
     * @param pageInfo 分页查询对象
	 * @return Long 历史记录数量
     */
	Long findHistoryListRowCount(RegisterApply registerApply,Page pageInfo);
    /**
     * 注册申请分页查询
     * @param registerApply 查询对象
     * @param pageInfo 分页查询对象
     * @return  List<RegisterApply>  注册申请列表 
     */
    List<RegisterApply> findListPage(RegisterApply registerApply, Page pageInfo);
	/**
	 * 注册申请历史记录分页查询
     * @param registerApply 查询对象
     * @param pageInfo 分页查询对象
     * @return List<HistoryRecord<RegisterApply>>  注册申请历史列表
	 */
    List<HistoryRecord<RegisterApply>> findHistoryListPage(RegisterApply registerApply, Page pageInfo);
	/**
     * 注册申请版本号查询
     * @param version 版本号
	 * @return RegisterApply 注册申请历史记录
     */
	RegisterApply findByVersion(Integer version);
	/**
	 * 添加注册申请查询条件
	 * @param criteria Hibernate Criteria对象
	 * @param registerApply 查询对象
	 */
	public void queryCause(Criteria criteria, RegisterApply registerApply);
	/**
	 * 注册申请关键字查询
	 * @param  queryKey 查询关键字
	 * @return List<RegisterApply> 注册申请列表
	 */
	List<RegisterApply> findByKey(Page pageInfo,String queryKey);
	/**
	 * 注册申请关键字查询数量
	 * @param queryKey 查询关键字
	 * @return Long 记录数量
	 */
	Long findRowCount(String queryKey);
    /**
     * 查找多个注册申请
     * @param  ids id数组
	 * @return List<RegisterApply>  注册申请列表
     */
	List<RegisterApply> findById(Integer[] ids);
}